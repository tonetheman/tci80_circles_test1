
local HOLE = {}
function HOLE.new()
	local self = {x=0,y=0,r=0,c=0,dx=0,dy=0}
	return self
end

local HOLES = {}
function HOLES.new(count) 
	local self = {count=count}
	for i=1,self.count do
		local h = HOLE.new()
		h.x = math.random(1,220)
		h.y = math.random(1,130)
		h.r = math.random(1,10)
		h.c = math.random(1,14)
		h.dx = math.random(1,2)
		h.dy = math.random(1,2)
		self[i] = h
	end
	return self
end

local holes = HOLES.new(100)

function reset(h)
	if math.random(1,100)<3 then
		h.dx = math.random(1,2)
		h.dy = math.random(1,2)
	end
end

function TIC()
	cls()
	for i=1,holes.count do
		local h = holes[i]
		h.x = h.x + h.dx
		h.y = h.y + h.dy
		if h.x < 0 then
			h.dx = h.dx * -1
			reset(h)
		end
		if h.x > 240 then
			h.dx = h.dx * -1
		end
		if h.y<0 then
			h.dy = h.dy * -1
			reset(h)
		end
		if h.y>136 then
			h.dy = h.dy * -1
		end
		circ(h.x,h.y,h.r+1,15)
		circ(h.x,h.y,h.r,h.c)

	end
end


