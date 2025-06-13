local holsteredgunsconvar = CreateConVar( "cl_holsteredguns", "1", { FCVAR_ARCHIVE, }, "Enable/Disable the rendering of the weapons on any player" )

local NEXT_WEAPONS_UPDATE=CurTime();

local weaponsinfos={}
weaponsinfos["weapon_physcannon"]={}
weaponsinfos["weapon_physcannon"].Model=""
weaponsinfos["weapon_physcannon"].Bone="ValveBiped.Bip01_Spine1"
weaponsinfos["weapon_physcannon"].BoneOffset={Vector(6,15,0),Angle(90,180,0)}
weaponsinfos["weapon_physcannon"].Priority="weapon_physgun"

weaponsinfos["weapon_physgun"]={}
weaponsinfos["weapon_physgun"].Model=""
weaponsinfos["weapon_physgun"].Bone="ValveBiped.Bip01_Spine1"
weaponsinfos["weapon_physgun"].DrawFunction=function(ent) end
weaponsinfos["weapon_physgun"].BoneOffset={Vector(6,15,0),Angle(90,180,0)}
weaponsinfos["weapon_physgun"].Skin=1;


weaponsinfos["weapon_physgun"].DrawFunction=function(ent)
    local attachment=ent:GetAttachment( 1)
    local StartPos = attachment.Pos + attachment.Ang:Forward()*4
    render.SetMaterial(physgunmat)
    render.DrawSprite(attachment.Pos,20,20,Color(255,255,255,255));
    render.SetMaterial(physgunmat1)
    render.DrawSprite(StartPos,20,20,Color(255,255,255,255));
end


------------------
--rifle
------------------
weaponsinfos["weapon_ak47"]={}
weaponsinfos["weapon_ak47"].Model="models/weapons/w_rif_ak47.mdl"
weaponsinfos["weapon_ak47"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_ak47"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_m4a1"]={}
weaponsinfos["weapon_m4a1"].Model="models/weapons/w_rif_m4a1.mdl"
weaponsinfos["weapon_m4a1"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_m4a1"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_awp"]={}
weaponsinfos["weapon_awp"].Model="models/weapons/w_snip_awp.mdl"
weaponsinfos["weapon_awp"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_awp"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_sg552"]={}
weaponsinfos["weapon_sg552"].Model="models/weapons/w_rif_sg552.mdl"
weaponsinfos["weapon_sg552"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_sg552"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_aug"]={}
weaponsinfos["weapon_aug"].Model="models/weapons/w_rif_aug.mdl"
weaponsinfos["weapon_aug"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_aug"].BoneOffset={Vector(14,8,5),Angle(90,0,100)}

weaponsinfos["weapon_famas"]={}
weaponsinfos["weapon_famas"].Model="models/weapons/w_rif_famas.mdl"
weaponsinfos["weapon_famas"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_famas"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_galil"]={}
weaponsinfos["weapon_galil"].Model="models/weapons/w_rif_galil.mdl"
weaponsinfos["weapon_galil"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_galil"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_sg550"]={}
weaponsinfos["weapon_sg550"].Model="models/weapons/w_snip_sg550.mdl"
weaponsinfos["weapon_sg550"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_sg550"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_g3sg1"]={}
weaponsinfos["weapon_g3sg1"].Model="models/weapons/w_snip_g3sg1.mdl"
weaponsinfos["weapon_g3sg1"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_g3sg1"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_scout"]={}
weaponsinfos["weapon_scout"].Model="models/weapons/w_snip_scout.mdl"
weaponsinfos["weapon_scout"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_scout"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

------------------
--smg
------------------

weaponsinfos["weapon_mp5navy"]={}
weaponsinfos["weapon_mp5navy"].Model="models/weapons/w_smg_mp5.mdl"
weaponsinfos["weapon_mp5navy"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_mp5navy"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_ump45"]={}
weaponsinfos["weapon_ump45"].Model="models/weapons/w_smg_ump45.mdl"
weaponsinfos["weapon_ump45"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_ump45"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_mac10"]={}
weaponsinfos["weapon_mac10"].Model="models/weapons/w_smg_mac10.mdl"
weaponsinfos["weapon_mac10"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_mac10"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_tmp"]={}
weaponsinfos["weapon_tmp"].Model="models/weapons/w_smg_tmp.mdl"
weaponsinfos["weapon_tmp"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_tmp"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

weaponsinfos["weapon_p90"]={}
weaponsinfos["weapon_p90"].Model="models/weapons/w_smg_p90.mdl"
weaponsinfos["weapon_p90"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_p90"].BoneOffset={Vector(14,8,6),Angle(90,0,100)}

------------------
--Heavy
------------------

weaponsinfos["weapon_m249"]={}
weaponsinfos["weapon_m249"].Model="models/weapons/w_mach_m249para.mdl"
weaponsinfos["weapon_m249"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_m249"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_m3"]={}
weaponsinfos["weapon_m3"].Model="models/weapons/w_shot_m3super90.mdl"
weaponsinfos["weapon_m3"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_m3"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}

weaponsinfos["weapon_xm1014"]={}
weaponsinfos["weapon_xm1014"].Model="models/weapons/w_shot_xm1014.mdl"
weaponsinfos["weapon_xm1014"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_xm1014"].BoneOffset={Vector(13,4,6),Angle(90,0,100)}
------------------
--Pistol
------------------
weaponsinfos["weapon_glock"]={}
weaponsinfos["weapon_glock"].Model="models/weapons/w_pist_glock18.mdl"
weaponsinfos["weapon_glock"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_glock"].BoneOffset={Vector(-4,-8,-2),Angle(5,270,0)}

weaponsinfos["weapon_usp"]={}
weaponsinfos["weapon_usp"].Model="models/weapons/w_pist_usp.mdl"
weaponsinfos["weapon_usp"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_usp"].BoneOffset={Vector(-4,-8,-2),Angle(5,270,0)}

weaponsinfos["weapon_p228"]={}
weaponsinfos["weapon_p228"].Model="models/weapons/w_pist_p228.mdl"
weaponsinfos["weapon_p228"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_p228"].BoneOffset={Vector(-4,-8,-2),Angle(5,270,0)}

weaponsinfos["weapon_fiveseven"]={}
weaponsinfos["weapon_fiveseven"].Model="models/weapons/w_pist_fiveseven.mdl"
weaponsinfos["weapon_fiveseven"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_fiveseven"].BoneOffset={Vector(-4,-8,-2),Angle(5,270,0)}

weaponsinfos["weapon_deagle"]={}
weaponsinfos["weapon_deagle"].Model="models/weapons/w_pist_deagle.mdl"
weaponsinfos["weapon_deagle"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_deagle"].BoneOffset={Vector(-4,-8,-2),Angle(5,270,0)}
------------------
--other
------------------
weaponsinfos["weapon_hegrenade"]={}
weaponsinfos["weapon_hegrenade"].Model="models/weapons/w_eq_fraggrenade.mdl"
weaponsinfos["weapon_hegrenade"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_hegrenade"].BoneOffset={Vector(3,-5,6),Angle(-95,0,0)}

weaponsinfos["weapon_smokegrenade"]={}
weaponsinfos["weapon_smokegrenade"].Model="models/weapons/w_eq_smokegrenade.mdl"
weaponsinfos["weapon_smokegrenade"].Bone="ValveBiped.Bip01_Pelvis"
weaponsinfos["weapon_smokegrenade"].BoneOffset={Vector(3,-5,6),Angle(-95,0,0)}
weaponsinfos["weapon_smokegrenade"].Priority="weapon_hegrenade"

weaponsinfos["weapon_cs_c4"]={}
weaponsinfos["weapon_cs_c4"].Model="models/weapons/w_c4.mdl"
weaponsinfos["weapon_cs_c4"].Bone="ValveBiped.Bip01_R_Clavicle"
weaponsinfos["weapon_cs_c4"].BoneOffset={Vector(5,0,4),Angle(20,0,0)}

-- weaponsinfos["weapon_knife"]={}
-- weaponsinfos["weapon_knife"].Model="models/weapons/w_knife_t.mdl"
-- weaponsinfos["weapon_knife"].Bone="ValveBiped.Bip01_Pelvis"
-- weaponsinfos["weapon_knife"].BoneOffset={Vector(3,-8,0),Angle(0,800,90)}


function LPGB(dotrace)
    if !dotrace then
    for i=0,LocalPlayer():GetBoneCount()-1 do
        print(LocalPlayer():GetBoneName(i))
    end
    else
    local entity=LocalPlayer():GetEyeTrace().Entity
    if !IsValid(entity) then return end
    for i=0,entity:GetBoneCount()-1 do
        print(entity:GetBoneName(i))
    end
    end
end

local function CalcOffset(pos,ang,off)
        return pos + ang:Right() * off.x + ang:Forward() * off.y + ang:Up() * off.z;
end

local function clhasweapon(pl,weaponclass)
    for i,v in pairs(pl:GetWeapons()) do
        if string.lower(v:GetClass())==string.lower(weaponclass) then return true end
    end

    return false;
end

local function clgetweapon(pl,weaponclass)
    for i,v in pairs(pl:GetWeapons()) do
        if string.lower(v:GetClass())==string.lower(weaponclass) then return v end
    end

    return nil;
end

local function playergettf2class(ply)
    return ply:GetPlayerClass()
end

local function IsTf2Class(ply)
   return LocalPlayer().IsHL2 && !LocalPlayer():IsHL2()
end

local function GetHolsteredWeaponTable(ply,indx)
    local class=IsTf2Class(ply) and playergettf2class(ply) or nil
    if !class then  return weaponsinfos[indx]
    else return (weaponsinfos[indx] && weaponsinfos[indx][class]) and weaponsinfos[indx][class] or nil
    end
end

local function thinkdamnit()
    if !holsteredgunsconvar:GetBool() then return end
    for _,pl in pairs(player.GetAll()) do
        if !IsValid(pl) then continue end

        if !pl.CL_CS_WEPS then
            pl.CL_CS_WEPS={}
        end

        if !pl:Alive() then pl.CL_CS_WEPS={} continue end

        if NEXT_WEAPONS_UPDATE<CurTime() then
            pl.CL_CS_WEPS={}
            NEXT_WEAPONS_UPDATE=CurTime()+5
        end

        for i,v in pairs(pl:GetWeapons())do
            if !IsValid(v) then continue; end

            if pl.CL_CS_WEPS[v:GetClass()] then continue end

            if !pl.CL_CS_WEPS[v:GetClass()] then
                local worldmodel=v.WorldModelOverride or v.WorldModel
                local attachedwmodel=v.AttachedWorldModel;

                if GetHolsteredWeaponTable(pl,v:GetClass()) && GetHolsteredWeaponTable(pl,v:GetClass()).Model then
                    worldmodel=GetHolsteredWeaponTable(pl,v:GetClass()).Model
                end
                if !worldmodel || worldmodel=="" then continue end;


                pl.CL_CS_WEPS[v:GetClass()]=ClientsideModel(worldmodel,RENDERGROUP_OPAQUE)
                pl.CL_CS_WEPS[v:GetClass()]:SetNoDraw(true)
                pl.CL_CS_WEPS[v:GetClass()]:SetSkin(v:GetSkin())
                pl.CL_CS_WEPS[v:GetClass()]:SetColor(v:GetColor())

                if GetHolsteredWeaponTable(pl,v:GetClass()) && GetHolsteredWeaponTable(pl,v:GetClass()).Scale then
                    pl.CL_CS_WEPS[v:GetClass()]:SetModelScale(GetHolsteredWeaponTable(pl,v:GetClass()).Scale);
                end

                if GetHolsteredWeaponTable(pl,v:GetClass()) && GetHolsteredWeaponTable(pl,v:GetClass()).BBP then
                    pl.CL_CS_WEPS[v:GetClass()].BuildBonePositions=GetHolsteredWeaponTable(pl,v:GetClass()).BBP;
                end

                if v.MaterialOverride || v:GetMaterial() then
                    pl.CL_CS_WEPS[v:GetClass()]:SetMaterial(v.MaterialOverride || v:GetMaterial())
                end
                if worldmodel == "models/weapons/w_models/w_shotgun.mdl" then
                    pl.CL_CS_WEPS[v:GetClass()]:SetMaterial("models/weapons/w_shotgun_tf/w_shotgun_tf")
                end

                pl.CL_CS_WEPS[v:GetClass()].WModelAttachment=v.WModelAttachment
                pl.CL_CS_WEPS[v:GetClass()].WorldModelVisible=v.WorldModelVisible


                if attachedwmodel then
                    pl.CL_CS_WEPS[v:GetClass()].AttachedModel=ClientsideModel(attachedwmodel,RENDERGROUP_OPAQUE)
                    pl.CL_CS_WEPS[v:GetClass()].AttachedModel:SetNoDraw(true)
                    pl.CL_CS_WEPS[v:GetClass()].AttachedModel:SetSkin(v:GetSkin())
                    pl.CL_CS_WEPS[v:GetClass()].AttachedModel:SetParent(pl.CL_CS_WEPS[v:GetClass()])
                    pl.CL_CS_WEPS[v:GetClass()].AttachedModel:AddEffects( EF_BONEMERGE, EF_BONEMERGE_FASTCULL, EF_PARENT_ANIMATES )
                end
            end
        end
    end
end

local function playerdrawdamnit(pl,legs)
    if !holsteredgunsconvar:GetBool() then return end
    if !IsValid(pl) then return end
    if !pl.CL_CS_WEPS then return end
    for i,v in pairs(pl.CL_CS_WEPS) do


        if GetHolsteredWeaponTable(pl,i) && (pl:GetActiveWeapon()==NULL || pl:GetActiveWeapon():GetClass()~=i) && clhasweapon(pl,i) then
            if GetHolsteredWeaponTable(pl,i).Priority then
                local priority=GetHolsteredWeaponTable(pl,i).Priority
                local bol=GetHolsteredWeaponTable(pl,priority) && (pl:GetActiveWeapon()==NULL || pl:GetActiveWeapon():GetClass()!=priority) && clhasweapon(pl,priority)
                if bol then continue; end
            end

            local oldpl=pl;
            local wep=clgetweapon(oldpl,i)


            local bone=pl:LookupBone(GetHolsteredWeaponTable(oldpl,i).Bone or "")
            if !bone then pl=oldpl;continue; end


            local matrix = pl:GetBoneMatrix(bone)
            if !matrix then pl=oldpl;continue; end
            local pos = matrix:GetTranslation()
			local ang = matrix:GetAngles()
            local pos=CalcOffset(pos,ang,GetHolsteredWeaponTable(oldpl,i).BoneOffset[1])
            if GetHolsteredWeaponTable(oldpl,i).Skin then v:SetSkin(GetHolsteredWeaponTable(oldpl,i).Skin) end

            v:SetRenderOrigin(pos)

            ang:RotateAroundAxis(ang:Forward(),GetHolsteredWeaponTable(oldpl,i).BoneOffset[2].p)
            ang:RotateAroundAxis(ang:Up(),GetHolsteredWeaponTable(oldpl,i).BoneOffset[2].y)
            ang:RotateAroundAxis(ang:Right(),GetHolsteredWeaponTable(oldpl,i).BoneOffset[2].r)

            v:SetRenderAngles(ang)
            if v.WorldModelVisible==nil || (v.WorldModelVisible!=false) then
                v:DrawModel();
            end

            if IsValid(v.AttachedModel) then
                v.AttachedModel:DrawModel();
            end
            if v.WModelAttachment && multimodel then
                multimodel.Draw(v.WModelAttachment, wep, {origin=pos, angles=ang})
                multimodel.DoFrameAdvance(v.WModelAttachment, CurTime(),wep)
            end

            if GetHolsteredWeaponTable(oldpl,i).DrawFunction then
                GetHolsteredWeaponTable(oldpl,i).DrawFunction(v,oldpl)
            end
            pl=oldpl;
        end
    end
end

local function drawlegsdamnit(legs)
    playerdrawdamnit(LocalPlayer(),legs)
end

hook.Add("PostLegsDraw","HG_DrawOnLegs",drawlegsdamnit)
hook.Add("Think","HG_Think",thinkdamnit)
hook.Add("PostPlayerDraw","HG_Draw",playerdrawdamnit)