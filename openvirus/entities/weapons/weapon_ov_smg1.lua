-- SMG1

SWEP.PrintName = "#HL2_SMG1"
SWEP.UseHands = true

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_smg1.mdl"
SWEP.WorldModel = "models/weapons/w_smg1.mdl"

SWEP.Primary.ClipSize = 45
SWEP.Primary.DefaultClip = 45
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight = 4
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.Slot = 2
SWEP.SlotPos = 0
SWEP.DrawAmmo = true
SWEP.DrawCrosshair = true
SWEP.BounceWeaponIcon = false
SWEP.DrawWeaponInfoBox = false


-- Initialize the weapon
function SWEP:Initialize()

    self:SetHoldType( "smg" )

end


-- Primary attack
function SWEP:PrimaryAttack()

    if ( !self:CanPrimaryAttack() ) then return end

    self.Weapon:EmitSound( "Weapon_SMG1.Single" )

    self:ShootBullet( 6, 1, math.random( 2, 5 ) / 100 )

    self:TakePrimaryAmmo( 1 )

    self.Owner:ViewPunch( Angle( -0.75, 0, 0 ) )

    self:SetNextPrimaryFire( CurTime() + 0.075 )

end


-- Secondary attack
function SWEP:SecondaryAttack()

    return

end


-- Reload
function SWEP:Reload()

	-- Play a sound
	if ( ( self.Owner:GetAmmoCount( self.Weapon:GetPrimaryAmmoType() ) > 0 ) && ( self.Weapon:Clip1() < self.Primary.DefaultClip ) ) then
	
		self.Weapon:EmitSound( "Weapon_SMG1.Reload" )
	
	end

	self.Weapon:DefaultReload( ACT_VM_RELOAD )

end


if ( CLIENT ) then

	-- Draw the weapon selection box
	function SWEP:DrawWeaponSelection( x, y, w, h, a )
	
        draw.RoundedBox( 6, x, y, w, h, Color( 0, 0, 100, a - 100 ) )
    
		surface.SetFont( "HL2MPTypeDeath" )
		surface.SetTextColor( 255, 255, 255, a )
		surface.SetTextPos( x + ( w / 3.25 ), y + ( h / 2.5 ) )
		surface.DrawText( "/" )
	
	end

end
