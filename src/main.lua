local World = require "ecs.world"

local SystemPos = require "ecs.system_pos"


World:debug()

local e1 = World:createEntity()
World:debug()
local e2 = World:createEntity()
local e3 = World:createEntity()
	World:addComponent(e3, 'pos', {x=7, y=42})
World:debug()
SystemPos:update(World)

World:removeEntityById(e2)
World:debug()

local e4 = World:createEntity()
	World:addComponent(e4, 'pos', {x=5, y=10})
local e5 = World:createEntity()
	World:addComponent(e5, 'pos', {x=50, y=50})
World:debug()

World:removeEntityById(e2)
World:debug()
World:removeEntityById(e1)
World:debug()

World:addComponent(e4, 'tag', 'test')
World:debug()

-- local e1 = Entity:new('a')
-- local e2 = Entity:new('b')

-- e1:draw()
-- e2:draw()

-- just info
print('..fin')
