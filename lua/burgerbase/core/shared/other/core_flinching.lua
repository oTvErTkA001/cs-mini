function BURGERBASE_FUNC_TRANSLATEANIM(hitgroup)

	local AnimationTable = {}
	AnimationTable[HITGROUP_HEAD] = {"flinch_head_01","flinch_head_02"}
	AnimationTable[HITGROUP_CHEST] = {"flinch_01","flinch_02","flinch_stomach_01","flinch_stomach_02"}
	AnimationTable[HITGROUP_STOMACH] = {"flinch_01","flinch_02","flinch_stomach_01","flinch_stomach_02"}
	AnimationTable[HITGROUP_LEFTARM] = {"flinch_shoulder_l"}
	AnimationTable[HITGROUP_RIGHTARM] = {"flinch_shoulder_r"}
	AnimationTable[HITGROUP_LEFTLEG] = {"flinch_phys_01","flinch_phys_02"}
	AnimationTable[HITGROUP_RIGHTLEG] = {"flinch_phys_01","flinch_phys_02"}
	AnimationTable[HITGROUP_GEAR] = {"flinch_phys_01","flinch_phys_02"}
	local SelectedAnimationTable = AnimationTable[hitgroup]
	
	if not SelectedAnimationTable then
		SelectedAnimationTable = {"flinch_phys_01","flinch_phys_02"}
	end

	local SelectedAnimation = SelectedAnimationTable[math.random(1,#SelectedAnimationTable)]
	
	return SelectedAnimation
	
end

function BURGERBASE_FUNC_SENDSEQUENCE(ply,anim)
	local Seq = ply:LookupSequence(anim)
	local SeqDur = ply:SequenceDuration(Seq)
	ply:AddVCDSequenceToGestureSlot( GESTURE_SLOT_FLINCH, Seq, 0, true )
	return SeqDur
end

if SERVER then

	function BURGERBASE_HOOK_FLINCHING(victim,hitgroup,dmginfo)
		net.Start("BURGERBASE_NET_FLINCH")
			net.WriteEntity(victim)
			net.WriteInt(hitgroup,4)
		net.Broadcast()
	end

	hook.Add("ScalePlayerDamage","BURGERBASE_HOOK_FLINCHING",BURGERBASE_HOOK_FLINCHING)

	util.AddNetworkString("BURGERBASE_NET_FLINCH")
	
end

if CLIENT then

	function BURGERBASE_NET_FLINCH(len)
		local victim = net.ReadEntity()
		local hitgroup = net.ReadInt(4)
		if victim and victim:IsValid() then
			BURGERBASE_FUNC_SENDSEQUENCE(victim,BURGERBASE_FUNC_TRANSLATEANIM(hitgroup))
		end
	end

	net.Receive( "BURGERBASE_NET_FLINCH", BURGERBASE_NET_FLINCH )
	
end


