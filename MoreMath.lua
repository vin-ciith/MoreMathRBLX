--[[
 __   __  _______  ______    _______    __   __  _______  _______  __   __ 
|  |_|  ||       ||    _ |  |       |  |  |_|  ||   _   ||       ||  | |  |
|       ||   _   ||   | ||  |    ___|  |       ||  |_|  ||_     _||  |_|  |
|       ||  | |  ||   |_||_ |   |___   |       ||       |  |   |  |       |
|       ||  |_|  ||    __  ||    ___|  |       ||       |  |   |  |       |
| ||_|| ||       ||   |  | ||   |___   | ||_|| ||   _   |  |   |  |   _   |
|_|   |_||_______||___|  |_||_______|  |_|   |_||__| |__|  |___|  |__| |__|
                                                                 
Welcome to MoreMath, the module that uses math, to add more math!
basically just for when people dont feel like making long functions
to do stuff they can just have one script do. (what im saying is im lazy so i made this lol)

MoreMath.Sine() Creates a sine wave, on the x, and y axis.
A sine wave is a curve representing periodic oscillations of constant amplitude as given by a sine function.

MoreMath.Lerp() Moves an value closer to another value based on a percentage.

MoreMath.Sway() Creates a sine wave, but on the x axis only.

MoreMath.Bob() Creates a sine wave, but on the y axis only.

MoreMath.Surface() Gets the surface an object is above.


]]

local MoreMath = {}

local ValidSine = {
	"Vector3";
	"GuiObject";
	"BasePart";
	"CFrame";
}

function MoreMath.Sine(obj,dt: number,percent: number)
	if typeof(obj) == "Instance" and obj:IsA("GuiObject") then
		local SineVal = 0
		SineVal += dt+math.random(0,.5)*(percent/10)
		return obj.Position+UDim2.new(0,math.sin(SineVal)*percent,0,math.cos(SineVal)*percent) --UDim2.new(origin.X.Scale,origin.X.Offset+math.sin(SineVal)*15,origin.Y.Scale,origin.Y.Offset+math.cos(SineVal)*15)
	elseif typeof(obj) == "Instance" and obj:IsA("BasePart") then
		local SineVal = 0
		SineVal += dt
		return obj.CFrame*CFrame.new(math.sin(SineVal)*(percent/10),math.cos(SineVal)*(percent/10),0)
	elseif typeof(obj) == "Vector3" then
		local SineVal = 0
		SineVal += dt
		return obj+Vector3.new(math.sin(SineVal)*(percent/1000),math.cos(SineVal)*(percent/1000),0)
	elseif typeof(obj) == "CFrame" then
		local SineVal = 0
		SineVal += dt
		return obj*CFrame.new(math.sin(SineVal)*(percent/10),math.cos(SineVal)*(percent/10),0)
	else
		warn("Sine is not an valid sine object!",5)
		warn("Valid types are:")

		for i,Valid in pairs(ValidSine) do
			warn(Valid)
		end
	end
end

function MoreMath.Lerp(a,b,c: number)
	return a+(b-a)*c	
end

function MoreMath.Sway(obj,dt,percent)
	if typeof(obj) == "Instance" and obj:IsA("GuiObject") then
		local SineVal = 0
		SineVal += dt+math.random(0,.5)*(percent/10)
		return obj.Position+UDim2.new(0,math.sin(SineVal)*percent,0,0) --UDim2.new(origin.X.Scale,origin.X.Offset+math.sin(SineVal)*15,origin.Y.Scale,origin.Y.Offset+math.cos(SineVal)*15)
	elseif typeof(obj) == "Instance" and obj:IsA("BasePart") then
		local SineVal = 0
		SineVal += dt*percent
		return obj.CFrame*CFrame.new(math.sin(SineVal)*(percent/10),0,0)
	elseif typeof(obj) == "Vector3" then
		local SineVal = 0
		SineVal += dt*percent
		return obj+Vector3.new(math.sin(SineVal)*(percent/1000),0,0)
	elseif typeof(obj) == "CFrame" then
		local SineVal = 0
		SineVal += dt
		return obj*CFrame.new(math.sin(SineVal)*(percent/10),math.cos(SineVal)*(percent/10),0)
	else
		warn("Sway Object is not an valid sway object!",5)
		warn("Valid types are:")

		for i,Valid in pairs(ValidSine) do
			warn(Valid)
		end
	end
end

function MoreMath.Bob(obj,dt,speed,amount)
	if typeof(obj) == "Instance" and obj:IsA("GuiObject") then
		local BobVal = dt*speed
		return obj.Position+UDim2.new(0,0,0,math.sin(BobVal)*amount)
	elseif typeof(obj) == "Instance" and obj:IsA("BasePart") then
		local BobVal = dt*speed
		return obj.CFrame*CFrame.new(0,math.sin(BobVal)*amount,0)
	elseif typeof(obj) == "Vector3" then
		local BobVal = dt*speed
		return obj+Vector3.new(0,math.sin(BobVal)*amount,0)
	elseif typeof(obj) == "CFrame" then
		local BobVal = dt*speed
		return obj*CFrame.new(0,math.sin(BobVal)*amount,0)
	else
		warn("Bob Object is not an valid Bob object!",5)
		warn("Valid types are:")
		
		for i,Valid in pairs(ValidSine) do
			warn(Valid)
		end
	end
end

function MoreMath.Surface(obj: Instance)
	if obj:IsA("Humanoid") then
		return obj.FloorMaterial
	elseif obj:IsA("BasePart") then
		local RayParam = RaycastParams.new()
		if obj.Parent and (obj.Parent:IsA("Folder") or obj.Parent:IsA("Model")) then
			RayParam.FilterDescendantsInstance = {obj.Parent}
		else
			RayParam.FilterDescendantsInstance = {obj}
		end
		
		local ray = workspace:Raycast(obj.Position,obj.CFrame.UpVector * -10,RayParam)

		if ray then
			local Material = ray.Instance.Material
			return Material
		else
			return false
		end
	end
end

return MoreMath
