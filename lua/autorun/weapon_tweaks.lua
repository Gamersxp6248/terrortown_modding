-- Manual SWEP tweaks
-- Use this file to apply manual tweaks and fixes onto a weapon, without having to overwrite said weapon's entire lua file

require("hookextras")

util.OnInitialize(function()
	local SWEP

	-- Magneto-stick: Allow for bigger camera turns while holding a prop without dropping it
	SWEP = weapons.GetStored("weapon_zm_carry")
	if SWEP then
		SWEP.dropAngleThreshold = 0.925
	end

	-- H.U.G.E-249: Buff DPS while trading a little bit of recoil for accuracy
	SWEP = weapons.GetStored("weapon_zm_sledge")
	if SWEP then
		SWEP.Primary.Damage = 10
		SWEP.Primary.Delay = 0.05
		SWEP.Primary.Cone = 0.066
		SWEP.Primary.Recoil = 2
	end

	-- G3SG1: Nerf the headshot damage, 4x is already insane
	SWEP = weapons.GetStored("weapon_ttt_g3sg1")
	if SWEP then
		SWEP.HeadshotDamage = 3
	end

	-- SG 550: Nerf the headshot damage, 4x is already insane
	SWEP = weapons.GetStored("weapon_ttt_sg550")
	if SWEP then
		SWEP.HeadshotDamage = 2.9
	end

	-- SG 552: Tweak DPS by decreasing fire-rate (and headshot damage), but allow it to be a lot more viable at range
	SWEP = weapons.GetStored("weapon_ttt_sg552")
	if SWEP then
		SWEP.Primary.Damage = 18
		SWEP.Primary.Delay = 0.145
		SWEP.Primary.Cone = 0.0085
		SWEP.Primary.Recoil = 1.05
		SWEP.HeadshotMultiplier = 2.4
	end

	-- AUG: Make it more viable at range
	SWEP = weapons.GetStored("weapon_ttt_aug")
	if SWEP then
		SWEP.Primary.Cone = 0.012
		SWEP.Primary.Recoil = 1
	end

	-- Auto Shotgun: Decrease damage, shoot one extra pellet, increase fire-rate, slightly widen accuracy cone
	SWEP = weapons.GetStored("weapon_zm_shotgun")
	if SWEP then
		-- This damage sounds terrible on paper, but for some reason it does a lot more damage in-game so it's okay
		SWEP.Primary.Damage = 6
		SWEP.Primary.NumShots = 9
		SWEP.Primary.Delay = 0.6
		SWEP.Primary.Cone = 0.085

		-- Rename it to the auto shotgun to avoid confusion
		if CLIENT then
			SWEP.PrintName = "Auto Shotgun"
		end
	end

	-- Pump Shotgun: Decrease damage, shoot one extra pellet
	SWEP = weapons.GetStored("weapon_ttt_pump")
	if SWEP then
		SWEP.Primary.Damage = 11
		SWEP.Primary.NumShots = 9
	end

	-- Kiss: Make its weird heart model hidden on players
	if CLIENT then
		SWEP = weapons.GetStored("weapon_ttt2_kiss")
		if SWEP then
			function SWEP:DrawWorldModel()
				if IsValid(self:GetOwner()) then return end
				self:DrawModel()
			end

			function SWEP:DrawWorldModelTranslucent() end
		end
	end
end)
