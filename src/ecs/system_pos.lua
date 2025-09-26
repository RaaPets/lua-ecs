local System = {
	ComponentType = 'pos',
}

function System:update(world)
		for _, entity in pairs(world.entities) do
			component = entity.components[self.ComponentType]
			if component ~= nil then
				self.local_update(component)
			end
		end
end

function System.local_update(pos)
	pos.x = 1 + pos.x
	pos.y = 3 + pos.y
end

return System
