local TableFamily = {"ent_burger_core_ammo","ent_burger_core_dropped_weapon","ent_burger_core_dropped_ammo","ent_burger_core_dropped_equipment"}

function BURGERBASE_HOOK_ShouldCollide(ent1,ent2)
	if table.HasValue(TableFamily,ent1:GetClass()) and table.HasValue(TableFamily,ent2:GetClass()) then
		return false
	end
end

hook.Add("ShouldCollide","BURGERBASE_HOOK_ShouldCollide",BURGERBASE_HOOK_ShouldCollide)
