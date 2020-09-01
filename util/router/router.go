package router

import (
	"strings"
	"sync"

	"github.com/gin-gonic/gin"
)

type RouteFactory struct {
	basePath      string
	routeWorkshop map[string]RouteHandlerBean
	subList       []*RouteFactory
	mut           sync.Mutex
}

type RouteHandlerBean struct {
	httpMethod string
	chain      gin.HandlersChain
}

func (factory *RouteFactory) SetBasePath(path string) *RouteFactory {
	if factory != nil {
		factory.mut.Lock()
		if factory.basePath == "" {
			factory.basePath = path
		}
		factory.mut.Unlock()
	}

	return factory
}

func (factory *RouteFactory) GetBasePath() string {
	if factory != nil {
		factory.mut.Lock()
		defer factory.mut.Unlock()
		return factory.basePath
	}
	return ""
}

func (factory *RouteFactory) AddRouteWorkshop(path string, httpMethod string, handlers ...gin.HandlerFunc) *RouteFactory {
	if factory == nil || path == "" || httpMethod == "" || len(handlers) == 0 {
		return factory
	}
	factory.mut.Lock()
	defer factory.mut.Unlock()
	if factory.routeWorkshop == nil {
		factory.routeWorkshop = make(map[string]RouteHandlerBean)
	}
	factory.routeWorkshop[path] = RouteHandlerBean{httpMethod: httpMethod, chain: handlers}
	return factory
}

func (factory *RouteFactory) AddSubFactory(list ...*RouteFactory) *RouteFactory {
	if factory == nil || len(list) == 0 {
		return factory
	}
	factory.mut.Lock()
	defer factory.mut.Unlock()
	if factory.subList == nil {
		factory.subList = make([]*RouteFactory, 0)
	}
	factory.subList = append(factory.subList, list...)
	return factory
}

func (factory *RouteFactory) GetSubFactory(path string) *RouteFactory {
	if factory == nil {
		return nil
	}
	factory.mut.Lock()
	defer factory.mut.Unlock()
	if factory.subList != nil {
		for idx, _ := range factory.subList {
			if factory.subList[idx] != nil {
				if factory.subList[idx].basePath == path {
					return factory.subList[idx]
				}
			}
		}
	} else {
		factory.subList = make([]*RouteFactory, 0)
	}
	f := &RouteFactory{basePath: path}
	factory.subList = append(factory.subList, f)
	return f
}

func (factory *RouteFactory) Register(group *gin.RouterGroup) *gin.RouterGroup {
	if factory == nil || group == nil {
		return nil
	}

	factory.mut.Lock()
	defer factory.mut.Unlock()
	g := group.Group(factory.basePath)
	registerRoutes(factory, g)
	return g
}

func (factory *RouteFactory) RegisterEngine(engine *gin.Engine) *gin.RouterGroup {
	if factory == nil || engine == nil {
		return nil
	}

	factory.mut.Lock()
	defer factory.mut.Unlock()
	g := engine.Group(factory.basePath)
	registerRoutes(factory, g)
	return g
}

func registerRoutes(factory *RouteFactory, group *gin.RouterGroup) {
	for path, bean := range factory.routeWorkshop {
		for _, method := range strings.Split(bean.httpMethod, "|") {
			group.Handle(method, path, bean.chain...)
		}
	}
	if factory.subList != nil {
		for idx, _ := range factory.subList {
			if factory.subList[idx] != nil {
				factory.subList[idx].Register(group)
			}
		}
	}
}
