//==============================================================================
// MutNoAutoFire (C) 2006-2009 Eliot van uytfanghe, .:..:. All Rights Reserved.
//==============================================================================
Class PinkRings_mini Extends xEmitter;

Simulated Function Tick( float Delta )
{
	Super.Tick(Delta);
	if( Owner != None )
	{
		//LifeSpan = 3;
		if( Owner.bNetOwner && Pawn(Owner.Owner) != None && Pawn(Owner.Owner).Controller != None && PlayerController(Pawn(Owner.Owner).Controller) != None )
		{
			if( PlayerController(Pawn(Owner.Owner).Controller).bBehindView )
			{
				if( Physics != PHYS_Trailer )
					SetPhysics( PHYS_Trailer );
			}
			else
			{
				if( Physics != PHYS_None )
				{
					SetPhysics( PHYS_Trailer );
					SetLocation( Owner.Owner.Location );
				}
			}
		}
		else if( Physics != PHYS_Trailer )
			SetPhysics( PHYS_Trailer );
	}
	else Destroy();
}

DefaultProperties
{
	mSpawningType=ST_Explode
	mStartParticles=0
	mMaxParticles=20
	mLifeRange(0)=2.000000
	mLifeRange(1)=2.000000
	mRegenRange(0)=2.000000
	mRegenRange(1)=4.000000
	mPosDev=(X=5.000000,Y=5.000000,Z=10.000000)
	mSpeedRange(0)=0.000000
	mSpeedRange(1)=0.000000
	mMassRange(0)=-0.100000
	mMassRange(1)=-0.100000
	mAirResistance=2.000000
	mOwnerVelocityFactor=1.000000
	mSizeRange(0)=2.000000
	mSizeRange(1)=2.000000
	mAttenKa=0.500000
	mAttenFunc=ATF_ExpInOut
	bTrailerSameRotation=True
	bNetTemporary=False
	bReplicateMovement=False
	Physics=PHYS_Trailer
	RemoteRole=ROLE_SimulatedProxy
	LifeSpan=0
	Skins(0)=Texture'XEffectMat.Ion.ion_ring'
	Style=STY_Additive
}
