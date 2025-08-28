---@diagnostic disable: duplicate-set-field, missing-return

---Base class for Scripted Weapons (SWEPs)
---@class SWEP : CBaseCombatWeapon
---@field printname string        # Display name (can be a localization token, e.g. "#HL2_357Handgun")
---@field viewmodel string        # Path to the first-person view model
---@field playermodel string      # Path to the third-person/world model
---@field anim_prefix string      # Animation prefix (defines which animations are used)
---@field bucket integer          # Weapon slot group (for weapon selection)
---@field bucket_position integer # Position inside the bucket
---@field clip_size integer       # Max ammo in primary clip
---@field clip2_size integer      # Max ammo in secondary clip (-1 = no secondary)
---@field default_clip integer    # Default ammo in primary clip
---@field default_clip2 integer   # Default ammo in secondary clip
---@field primary_ammo string     # Ammo type for primary fire
---@field secondary_ammo string   # Ammo type for secondary fire
---@field weight integer          # Weapon weight (affects auto switch)
---@field item_flags integer      # Internal engine flags
---@field damage number           # Base weapon damage
---@field SoundData table         # Table of sounds (keys like "empty", "single_shot")
---@field showusagehint integer   # Show usage hint (0/1)
---@field autoswitchto integer    # Auto-switch to this weapon (0/1)
---@field autoswitchfrom integer  # Auto-switch away from this weapon (0/1)
---@field BuiltRightHanded integer # 1 if built for right-handed use
---@field AllowFlipping integer   # 1 if flipping/mirroring is allowed
---@field MeleeWeapon integer     # 1 if melee weapon
---@field m_acttable table        # Activity translation table
SWEP = {}

---Called when the weapon is first initialized.
function SWEP:Initialize() end

---Think logic, called every frame while weapon is active. Use for per-frame updates.
function SWEP:Think() end

---Called when the weapon is holstered (put away). Return true if holster allowed.
---@param pSwitchingTo any Weapon being switched to
---@return boolean success
function SWEP:Holster(pSwitchingTo) end

---Set when code is running on the client.
_CLIENT = true

---Set when code is running on the server.
_SERVER = true

---@class random
random = {}

---Returns a random float between a and b.
---If only one argument is given, returns between -a and a.
---If no arguments are given, returns 0.
---@param a number|nil
---@param b number|nil
---@return number
function random.RandomFloat(a, b) end

---Returns a random float between a and b, modified by an exponent.
---@param a number|nil
---@param b number|nil
---@param exponent number|nil Defaults to 1.0
---@return number
function random.RandomFloatExp(a, b, exponent) end

---Returns a random integer between a and b.
---If only one argument is given, returns between -a and a.
---If no arguments are given, returns 0.
---@param a integer|nil
---@param b integer|nil
---@return integer
function random.RandomInt(a, b) end

---Sets the seed of the random number generator.
---@param seed integer
function random.SetSeed(seed) end

---@class gpGlobals
gpGlobals = {}

---Returns the time elapsed in seconds for the current frame (absolute frame time).
---@return number
function gpGlobals.absoluteframetime() end

---Returns the current server or simulation time (seconds).
---@return number
function gpGlobals.curtime() end

---Returns the current rendered frame count.
---@return integer
function gpGlobals.framecount() end

---Returns time elapsed in seconds since the last frame.
---@return number
function gpGlobals.frametime() end

---Returns seconds per server tick (tick interval).
---@return number
function gpGlobals.interval_per_tick() end

---Returns true if the current environment is a client.
---@return boolean
function gpGlobals.IsClient() end

---Returns configured maximum number of clients on the server.
---@return integer
function gpGlobals.maxClients() end

---Returns the network protocol version used by the server.
---@return integer
function gpGlobals.network_protocol() end

---Returns the real world time since server start (seconds).
---@return number
function gpGlobals.realtime() end

---Returns how many simulation ticks happened this frame.
---@return integer
function gpGlobals.simTicksThisFrame() end

---Returns the current server tick count.
---@return integer
function gpGlobals.tickcount() end

---@class Vector
---@field x number # X component
---@field y number # Y component
---@field z number # Z component
Vector = {}

---Create a new Vector. Defaults to (0,0,0).
---@param x number|nil
---@param y number|nil
---@param z number|nil
---@return Vector
function Vector.Vector(x, y, z) end

---Return the cross product of two vectors.
---@param a Vector
---@param b Vector
---@return Vector
function Vector:Cross(a, b) end

---Return the euclidean distance to another vector.
---@param a Vector
---@return number
function Vector:DistTo(a) end

---Return squared euclidean distance to another vector (faster).
---@param a Vector
---@return number
function Vector:DistToSqr(a) end

---Return dot product with another vector.
---@param a Vector
---@return number
function Vector:Dot(a) end

---Initialize components (mutates).
---@param x number
---@param y number
---@param z number
function Vector:Init(x, y, z) end

---Mark vector as invalid (engine sentinel).
function Vector:Invalidate() end

---Return whether length is greater than value.
---@param f number
---@return boolean
function Vector:IsLengthGreaterThan(f) end

---Return whether length is less than value.
---@param f number
---@return boolean
function Vector:IsLengthLessThan(f) end

---Return whether the vector contains only valid finite numbers.
---@return boolean
function Vector:IsValid() end

---Return vector length (magnitude).
---@return number
function Vector:Length() end

---Return 2D length (ignores z).
---@return number
function Vector:Length2D() end

---Return squared 2D length.
---@return number
function Vector:Length2DSqr() end

---Return squared length (faster than Length).
---@return number
function Vector:LengthSqr() end

---Return component-wise max between two vectors.
---@param a Vector
---@return Vector
function Vector:Max(a) end

---Return component-wise min between two vectors.
---@param a Vector
---@return Vector
function Vector:Min(a) end

---Perform MulAdd: this = a + b * scalar (mutates).
---@param a Vector
---@param b Vector
---@param scalar number
function Vector:MulAdd(a, b, scalar) end

---Negate components (mutates).
function Vector:Negate() end

---Normalize in-place. Returns original length.
---@return number
function Vector:NormalizeInPlace() end

---Set vector to a random point inside a sphere of given radii (mutates).
---@param minRadius number
---@param maxRadius number
function Vector:Random(minRadius, maxRadius) end

---Return whether this vector is within axis-aligned box [min, max].
---@param minV Vector
---@param maxV Vector
---@return boolean
function Vector:WithinAABox(minV, maxV) end

---Set components to zero (mutates).
function Vector:Zero() end

---Index metamethod: access x/y/z or methods.
---@param key string
---@return number|function
function Vector:__index(key) end

---Newindex metamethod: assign x/y/z.
---@param key string
---@param value number
function Vector:__newindex(key, value) end

---Return string representation, e.g. "Vector: (x y z)".
---@return string
function Vector:__tostring() end

---Equality (component-wise).
---@param a Vector
---@param b Vector
---@return boolean
function Vector.__eq(a, b) end

---Addition (component-wise).
---@param a Vector
---@param b Vector
---@return Vector
function Vector.__add(a, b) end

---Subtraction (component-wise).
---@param a Vector
---@param b Vector
---@return Vector
function Vector.__sub(a, b) end

---Multiplication (vector * scalar or scalar * vector).
---@param a Vector|number
---@param b Vector|number
---@return Vector
function Vector.__mul(a, b) end

---Division (vector / scalar).
---@param a Vector
---@param b number
---@return Vector
function Vector.__div(a, b) end

---Unary minus (negation).
---@param a Vector
---@return Vector
function Vector.__unm(a) end

-- Common global constants
---@type Vector
vec3_origin = nil -- global Vector constant (0,0,0)
---@type Vector
vec3_invalid = nil -- global invalid vector sentinel

--- Utility functions for vector calculations, random number generation, tracing, and visual effects.
---@class UTIL
UTIL = {}

--- Convert a vector to a yaw angle (in degrees).
---@param vec Vector Input vector
---@return number Yaw angle
function UTIL.VecToYaw(vec) end

--- Convert a vector to a pitch angle (in degrees).
---@param vec Vector Input vector
---@return number Pitch angle
function UTIL.VecToPitch(vec) end

--- Convert a yaw angle (in degrees) to a normalized direction vector.
---@param yaw number Yaw angle
---@return Vector Direction vector
function UTIL.YawToVector(yaw) end

--- Generate a random float between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value
---@param max number Maximum value
---@param seed integer? Optional seed value (default: 0)
---@return number Random float
function UTIL.SharedRandomFloat(seedName, min, max, seed) end

--- Generate a random integer between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min integer Minimum value
---@param max integer Maximum value
---@param seed integer? Optional seed value (default: 0)
---@return integer Random integer
function UTIL.SharedRandomInt(seedName, min, max, seed) end

--- Generate a random vector with components between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value for vector components
---@param max number Maximum value for vector components
---@param seed integer? Optional seed value (default: 0)
---@return Vector Random vector
function UTIL.SharedRandomVector(seedName, min, max, seed) end

--- Generate a random QAngle with components between min and max with a given seed name.
---@param seedName string Seed identifier for consistent random results
---@param min number Minimum value for angle components
---@param max number Maximum value for angle components
---@param seed integer? Optional seed value (default: 0)
---@return QAngle Random angle
function UTIL.SharedRandomAngle(seedName, min, max, seed) end

--- Perform a line trace from start to end with specified mask and collision group.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceLine(startPos, endPos, mask, ignoreEnt, collisionGroup, trace) end

--- Perform a hull trace from start to end with specified bounds, mask, and collision group.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mins Vector Minimum bounds of the hull
---@param maxs Vector Maximum bounds of the hull
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceHull(startPos, endPos, mins, maxs, mask, ignoreEnt, collisionGroup, trace) end

--- Perform a trace for a specific entity from start to end with mask and collision group.
---@param ent CBaseEntity Entity to trace
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param mask integer Trace mask (bit flags)
---@param ignoreEnt CBaseEntity Entity to ignore during the trace
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceEntity(ent, startPos, endPos, mask, ignoreEnt, collisionGroup, trace) end

--- Check if two entities share the same root parent in the movement hierarchy.
---@param ent1 CBaseEntity First entity
---@param ent2 CBaseEntity Second entity
---@return boolean True if they share the same root parent
function UTIL.EntityHasMatchingRootParent(ent1, ent2) end

--- Get the contents (e.g., solid, water) at a specific point in the world.
---@param point Vector World position to check
---@return integer Contents bitmask
function UTIL.PointContents(point) end

--- Perform a model trace from start to end with specified angles and entity.
---@param startPos Vector Start position of the trace
---@param endPos Vector End position of the trace
---@param angles Vector Model orientation angles
---@param axis Vector Model axis
---@param ent CBaseEntity Entity whose model is traced
---@param collisionGroup integer Collision group for filtering
---@param trace trace_t Output trace result
function UTIL.TraceModel(startPos, endPos, angles, axis, ent, collisionGroup, trace) end

--- Create a particle tracer effect from start to end.
---@param effectName string Name of the particle effect
---@param startPos Vector Start position of the tracer
---@param endPos Vector End position of the tracer
---@param entIndex integer? Entity index (default: 0)
---@param attachment integer? Attachment point index (default: 0)
---@param doWhiz boolean? Play whiz sound (default: false)
function UTIL.ParticleTracer(effectName, startPos, endPos, entIndex, attachment, doWhiz) end

--- Create a tracer effect from start to end with customizable parameters.
---@param startPos Vector Start position of the tracer
---@param endPos Vector End position of the tracer
---@param entIndex integer? Entity index (default: 0)
---@param attachment integer? Attachment point index (default: -1)
---@param velocity number? Tracer velocity (default: 0)
---@param doWhiz boolean? Play whiz sound (default: false)
---@param effectName string? Particle effect name (default: nil)
---@param force integer? Force value (default: 0)
function UTIL.Tracer(startPos, endPos, entIndex, attachment, velocity, doWhiz, effectName, force) end

--- Create a blood drip effect at a specific location with direction and color.
---@param origin Vector Position of the blood drip
---@param direction Vector Direction of the drip
---@param color integer Blood color index
---@param amount integer Amount of blood
function UTIL.BloodDrips(origin, direction, color, amount) end

--- Check if the game is in low-violence mode (e.g., for regional settings).
---@return boolean True if low-violence mode is active
function UTIL.IsLowViolence() end

--- Check if blood should be shown for a given blood color.
---@param color integer Blood color index
---@return boolean True if blood should be shown
function UTIL.ShouldShowBlood(color) end

--- Create a blood impact effect at a specific location.
---@param origin Vector Position of the impact
---@param direction Vector Direction of the impact
---@param color integer Blood color index
---@param amount integer Amount of blood
function UTIL.BloodImpact(origin, direction, color, amount) end

--- Apply a blood decal based on a trace result and blood color.
---@param trace trace_t Trace result
---@param color integer Blood color index
function UTIL.BloodDecalTrace(trace, color) end

--- Apply a decal based on a trace result and decal name.
---@param trace trace_t Trace result
---@param decalName string Name of the decal
function UTIL.DecalTrace(trace, decalName) end

--- Check if a space defined by a bounding box is empty (no collisions).
---@param ent CBaseEntity Entity to ignore (or nil)
---@param mins Vector Minimum bounds of the box
---@param maxs Vector Maximum bounds of the box
---@return boolean True if the space is empty
function UTIL.IsSpaceEmpty(ent, mins, maxs) end

--- Get a player by their index.
---@param index integer Player index
---@return CBasePlayer Player entity or nil if not found
function UTIL.PlayerByIndex(index) end

---Check if a certain entity class can be created.
---@param className string
---@return boolean
function UTIL.CanCreateEntityClass(className) end

---Get the entity index of a CBaseEntity.
---@param ent CBaseEntity
---@return integer
function UTIL.ENTINDEX(ent) end

---Get the entity object from an index.
---@param index integer
---@return CBaseEntity
function UTIL.INDEXENT(index) end

---Check if the given entity is null.
---@param ent CBaseEntity
---@return boolean
function UTIL.FNullEnt(ent) end

---Compare two strings for equality.
---@param str1 string
---@param str2 string
---@return boolean
function UTIL.FStrEq(str1, str2) end

---Set entity size (bounding box).
---@param ent CBaseEntity
---@param mins Vector
---@param maxs Vector
function UTIL.SetSize(ent, mins, maxs) end

---Clear a trace result.
---@param tr trace_t
function UTIL.ClearTrace(tr) end

---Precache a decal by name.
---@param decalName string
---@param bClientOnly boolean?
---@return integer
function UTIL.PrecacheDecal(decalName, bClientOnly) end

---Get simulation interval (frame time).
---@return number
function UTIL.GetSimulationInterval() end

---Get a player entity by index.
---@param index integer
---@return CBasePlayer
function UTIL.PlayerByIndex(index) end

---Get the local player.
---@return CBasePlayer
function UTIL.GetLocalPlayer() end

---Get the listen server host player.
---@return CBasePlayer
function UTIL.GetListenServerHost() end

---Get a player by user ID.
---@param userid integer
---@return CBasePlayer
function UTIL.PlayerByUserId(userid) end

---Get a player by name.
---@param name string
---@return CBasePlayer
function UTIL.PlayerByName(name) end

---Check if the last command was issued by a server admin.
---@return boolean
function UTIL.IsCommandIssuedByServerAdmin() end

---Get entity by index.
---@param index integer
---@return CBaseEntity
function UTIL.EntityByIndex(index) end

---Get player connection info (ping, packet loss).
---@param index integer
---@return integer ping
---@return integer packetloss
function UTIL.GetPlayerConnectionInfo(index) end

---Check if client PVS (potentially visible set) is expanded.
---@return boolean
function UTIL.ClientPVSIsExpanded() end

---Find a client in PVS from min and max vectors.
---@param mins Vector
---@param maxs Vector
---@return CBasePlayer
function UTIL.FindClientInPVS(mins, maxs) end

---Get all entities inside a box.
---@param maxEntities integer Max number of entities to retrieve
---@param mins Vector
---@param maxs Vector
---@param mask integer
---@return integer count
---@return CBaseEntity[] entities
function UTIL.EntitiesInBox(maxEntities, mins, maxs, mask) end

---Get all entities inside a sphere.
---@param maxEntities integer Max number of entities to retrieve
---@param center Vector
---@param radius number
---@param mask integer
---@return integer count
---@return CBaseEntity[] entities
function UTIL.EntitiesInSphere(maxEntities, center, radius, mask) end

---Remove an entity.
---@param ent CBaseEntity
function UTIL.Remove(ent) end

---Disable immediate removal.
function UTIL.DisableRemoveImmediate() end

---Enable immediate removal.
function UTIL.EnableRemoveImmediate() end

---Immediately remove an entity.
---@param ent CBaseEntity
function UTIL.RemoveImmediate(ent) end

---Drop an entity to the floor.
---@param ent CBaseEntity
---@param flags integer
---@param groundEnt CBaseEntity?
---@return integer
function UTIL.DropToFloor(ent, flags, groundEnt) end

---Set an entity's origin.
---@param ent CBaseEntity
---@param pos Vector
---@param bNoPhysics boolean?
function UTIL.SetOrigin(ent, pos, bNoPhysics) end

---Emit an ambient sound.
---@param entIndex integer
---@param pos Vector
---@param soundName string
---@param volume number
---@param level integer
---@param flags integer
---@param pitch integer
---@param delay number?
---@return number duration
function UTIL.EmitAmbientSound(entIndex, pos, soundName, volume, level, flags, pitch, delay) end

---Screen shake effect at a position.
---@param origin Vector
---@param amplitude number
---@param frequency number
---@param duration number
---@param radius number
---@param command integer
---@param bAirborne boolean?
function UTIL.ScreenShake(origin, amplitude, frequency, duration, radius, command, bAirborne) end

---Screen shake effect on an object.
---@param ent CBaseEntity
---@param origin Vector
---@param amplitude number
---@param frequency number
---@param duration number
---@param radius number
---@param command integer
---@param bAirborne boolean?
function UTIL.ScreenShakeObject(ent, origin, amplitude, frequency, duration, radius, command, bAirborne) end

---View punch effect on a player.
---@param origin Vector
---@param angle QAngle
---@param magnitude number
---@param bClamp boolean
function UTIL.ViewPunch(origin, angle, magnitude, bClamp) end

---Show message to a player.
---@param msg string
---@param ply CBasePlayer
function UTIL.ShowMessage(msg, ply) end

---Show message to all players.
---@param msg string
function UTIL.ShowMessageAll(msg) end

---Create muzzle flash effect.
---@param origin Vector
---@param angle QAngle
---@param entIndex integer
---@param attachment integer
function UTIL.MuzzleFlash(origin, angle, entIndex, attachment) end

---Check if an entity is valid.
---@param ent CBaseEntity
---@return boolean
function UTIL.IsValid(ent) end

--- Interface for handling movement and collision interactions.
---@class IMoveHelper
IMoveHelper = {}

--- Create a new move helper instance.
---@return IMoveHelper
function IMoveHelper.MoveHelper() end

--- Reset the list of touched entities for this move helper.
function IMoveHelper:ResetTouchList() end

--- Add a trace result and velocity to the touched list.
---@param trace trace_t Trace result
---@param velocity Vector Impact velocity
---@return boolean True if added successfully
function IMoveHelper:AddToTouched(trace, velocity) end

--- Process all recorded impact events.
function IMoveHelper:ProcessImpacts() end

--- Print a formatted message to the console (debugging).
---@param index integer Message index
---@param message string Message to print
function IMoveHelper:Con_NPrintf(index, message) end

--- Apply falling damage to the associated player.
---@return boolean True if damage was applied
function IMoveHelper:PlayerFallingDamage() end

--- Set a player animation state.
---@param anim integer PLAYER_ANIM enum value
function IMoveHelper:PlayerSetAnimation(anim) end

--- Get the surface properties for the current movement context.
---@return IPhysicsSurfaceProps Surface properties object
function IMoveHelper:GetSurfaceProps() end

--- String representation of the IMoveHelper object.
---@return string
function IMoveHelper:__tostring() end

--- Represents physical parameters for a surface (e.g., friction, elasticity).
---@class surfacephysicsparams_t
---@field friction number Surface friction coefficient
---@field elasticity number Surface elasticity (bounciness)
---@field density number Surface density
---@field thickness number Surface thickness
---@field dampening number Surface dampening factor
surfacephysicsparams_t = {}

--- Represents audio parameters for a surface (e.g., sound reflectivity).
---@class surfaceaudioparams_t
---@field reflectivity number Sound reflectivity
---@field hardnessFactor number Hardness factor for audio
---@field roughnessFactor number Roughness factor for audio
---@field roughThreshold number Threshold for rough surface sounds
---@field hardThreshold number Threshold for hard surface sounds
---@field hardVelocityThreshold number Velocity threshold for hard surface sounds
surfaceaudioparams_t = {}

--- Represents sound names for a surface, mapped to string identifiers.
---@class surfacesoundnames_t
---@field stepleft string Sound for left footstep
---@field stepright string Sound for right footstep
---@field impactSoft string Sound for soft impact
---@field impactHard string Sound for hard impact
---@field scrapeSmooth string Sound for smooth surface scrape
---@field scrapeRough string Sound for rough surface scrape
---@field bulletImpact string Sound for bullet impact
---@field rolling string Sound for rolling on surface
---@field breakSound string Sound for surface breaking
---@field strainSound string Sound for surface straining
surfacesoundnames_t = {}

--- Represents sound handles for a surface, mapped to integer indices.
---@class surfacesoundhandles_t
---@field stepleft integer Handle for left footstep sound
---@field stepright integer Handle for right footstep sound
---@field impactSoft integer Handle for soft impact sound
---@field impactHard integer Handle for hard impact sound
---@field scrapeSmooth integer Handle for smooth surface scrape sound
---@field scrapeRough integer Handle for rough surface scrape sound
---@field bulletImpact integer Handle for bullet impact sound
---@field rolling integer Handle for rolling sound
---@field breakSound integer Handle for surface breaking sound
---@field strainSound integer Handle for surface straining sound
surfacesoundhandles_t = {}

--- Represents game-specific properties for a surface.
---@class surfacegameprops_t
---@field maxSpeedFactor number Factor affecting maximum movement speed
---@field jumpFactor number Factor affecting jump height
---@field material integer Material identifier
---@field climbable integer Indicates if the surface is climbable (0 or 1)
---@field pad integer Padding field (unused)
surfacegameprops_t = {}

--- Represents complete surface data, combining physics, audio, and game properties.
---@class surfacedata_t
---@field physics surfacephysicsparams_t Physical parameters
---@field audio surfaceaudioparams_t Audio parameters
---@field sounds surfacesoundnames_t Sound names
---@field game surfacegameprops_t Game-specific properties
---@field soundhandles surfacesoundhandles_t Sound handles
surfacedata_t = {}

--- Physics environment functions for managing global physics settings.
---@class physenv
physenv = {}

--- Clean up the list of physics objects marked for deletion.
function physenv.CleanupDeleteList() end

--- Clear physics performance statistics.
function physenv.ClearStats() end

--- Debug check for physics contacts.
function physenv.DebugCheckContacts() end

--- Get the number of active physics objects.
---@return number Count of active objects
function physenv.GetActiveObjectCount() end

--- Get the current air density in the physics environment.
---@return number Air density
function physenv.GetAirDensity() end

--- Get the gravity vector of the physics environment.
---@return Vector Gravity vector
function physenv.GetGravity() end

--- Get the time of the next physics simulation frame.
---@return number Frame time
function physenv.GetNextFrameTime() end

--- Get performance settings for the physics environment.
---@return table Physics performance parameters
function physenv.GetPerformanceSettings() end

--- Get the current simulation time.
---@return number Simulation time
function physenv.GetSimulationTime() end

--- Get the time step used for physics simulation.
---@return number Simulation time step
function physenv.GetSimulationTimestep() end

--- Check if the physics environment is currently simulating.
---@return boolean True if in simulation
function physenv.IsInSimulation() end

--- Perform post-restore operations for the physics environment.
function physenv.PostRestore() end

--- Reset the simulation clock.
function physenv.ResetSimulationClock() end

--- Set the air density for the physics environment.
---@param density number Air density value
function physenv.SetAirDensity(density) end

--- Set the gravity vector for the physics environment.
---@param gravity Vector Gravity vector
function physenv.SetGravity(gravity) end

--- Set performance settings for the physics environment.
---@param settings table Performance settings
function physenv.SetPerformanceSettings(settings) end

--- Enable or disable quick deletion of physics objects.
---@param enable boolean True to enable quick deletion
function physenv.SetQuickDelete(enable) end

--- Set the time step for physics simulation.
---@param timestep number Simulation time step
function physenv.SetSimulationTimestep(timestep) end

--- Run a physics simulation for a specified time.
---@param deltaTime number Time to simulate
function physenv.Simulate(deltaTime) end

--- Interface for manipulating physics objects (e.g., props, entities).
--- **Warning**: Physics objects in Lua are unsafe as they may reference entities that no longer exist.
--- Store and use with caution.
---@class IPhysicsObject
IPhysicsObject = {}

--- Add velocity and angular velocity to the physics object.
---@param velocity Vector Linear velocity to add
---@param angularVelocity Vector Angular velocity to add
function IPhysicsObject:AddVelocity(velocity, angularVelocity) end

--- Apply a force at the object's center of mass.
---@param force Vector Force to apply
function IPhysicsObject:ApplyForceCenter(force) end

--- Apply a force at a specific point on the object.
---@param force Vector Force to apply
---@param point Vector Point of application
function IPhysicsObject:ApplyForceOffset(force, point) end

--- Apply a torque at the object's center of mass.
---@param torque Vector Torque to apply
function IPhysicsObject:ApplyTorqueCenter(torque) end

--- Make the object hinged along a specified axis.
---@param axis integer Axis index (0 = x, 1 = y, 2 = z)
function IPhysicsObject:BecomeHinged(axis) end

--- Make the object a trigger (non-colliding, event-driven).
function IPhysicsObject:BecomeTrigger() end

--- Calculate angular drag for a given force vector.
---@param force Vector Force vector
---@return number Angular drag
function IPhysicsObject:CalculateAngularDrag(force) end

--- Calculate force and torque from a force applied at a point.
---@param force Vector Force to apply
---@param point Vector Point of application
---@return Vector centerForce Resulting force at center
---@return Vector centerTorque Resulting torque at center
function IPhysicsObject:CalculateForceOffset(force, point) end

--- Calculate linear drag for a given force vector.
---@param force Vector Force vector
---@return number Linear drag
function IPhysicsObject:CalculateLinearDrag(force) end

--- Calculate velocity and angular velocity from a force at a point.
---@param force Vector Force to apply
---@param point Vector Point of application
---@return Vector centerVelocity Resulting linear velocity
---@return Vector centerAngularVelocity Resulting angular velocity
function IPhysicsObject:CalculateVelocityOffset(force, point) end

--- Enable or disable collisions for the object.
---@param enable boolean True to enable collisions
function IPhysicsObject:EnableCollisions(enable) end

--- Enable or disable drag for the object.
---@param enable boolean True to enable drag
function IPhysicsObject:EnableDrag(enable) end

--- Enable or disable gravity for the object.
---@param enable boolean True to enable gravity
function IPhysicsObject:EnableGravity(enable) end

--- Enable or disable motion for the object.
---@param enable boolean True to enable motion
function IPhysicsObject:EnableMotion(enable) end

--- Get the callback flags for the object.
---@return integer Callback flags
function IPhysicsObject:GetCallbackFlags() end

--- Get the contact point and object from the last collision.
---@return boolean Success True if contact exists
---@return Vector contactPoint Contact point
---@return IPhysicsObject contactObject Contacted object
function IPhysicsObject:GetContactPoint() end

--- Get the contents mask of the object.
---@return integer Contents mask
function IPhysicsObject:GetContents() end

--- Get the damping values for speed and rotation.
---@return number speed Damping for linear speed
---@return number rot Damping for rotation
function IPhysicsObject:GetDamping() end

--- Get the total energy of the object.
---@return number Energy
function IPhysicsObject:GetEnergy() end

--- Get the game-specific flags for the object.
---@return integer Game flags
function IPhysicsObject:GetGameFlags() end

--- Get the game-specific index for the object.
---@return integer Game index
function IPhysicsObject:GetGameIndex() end

--- Get the implicit velocity and angular velocity of the object.
---@return Vector velocity Linear velocity
---@return Vector angularVelocity Angular velocity
function IPhysicsObject:GetImplicitVelocity() end

--- Get the inertia vector of the object.
---@return Vector Inertia
function IPhysicsObject:GetInertia() end

--- Get the inverse inertia vector of the object.
---@return Vector Inverse inertia
function IPhysicsObject:GetInvInertia() end

--- Get the inverse mass of the object.
---@return number Inverse mass
function IPhysicsObject:GetInvMass() end

--- Get the mass of the object.
---@return number Mass
function IPhysicsObject:GetMass() end

--- Get the center of mass in local space.
---@return Vector Mass center
function IPhysicsObject:GetMassCenterLocalSpace() end

--- Get the material index of the object.
---@return integer Material index
function IPhysicsObject:GetMaterialIndex() end

--- Get the name of the object.
---@return string Object name
function IPhysicsObject:GetName() end

--- Get the position and orientation of the object.
---@return Vector worldPosition World position
---@return QAngle angles Orientation
function IPhysicsObject:GetPosition() end

--- Get the shadow controller position and orientation.
---@return integer success Success code
---@return Vector position Shadow position
---@return QAngle angles Shadow orientation
function IPhysicsObject:GetShadowPosition() end

--- Get the radius of the object if it is a sphere.
---@return number Sphere radius
function IPhysicsObject:GetSphereRadius() end

--- Get the current velocity and angular velocity of the object.
---@return Vector velocity Linear velocity
---@return Vector angularVelocity Angular velocity
function IPhysicsObject:GetVelocity() end

--- Get the velocity at a specific point on the object.
---@param point Vector Point to check
---@return Vector Velocity at point
function IPhysicsObject:GetVelocityAtPoint(point) end

--- Check if the object is asleep (not simulating).
---@return boolean True if asleep
function IPhysicsObject:IsAsleep() end

--- Check if the object is attached to a constraint.
---@param allowFixed boolean True to include fixed constraints
---@return boolean True if attached
function IPhysicsObject:IsAttachedToConstraint(allowFixed) end

--- Check if collisions are enabled for the object.
---@return boolean True if collisions are enabled
function IPhysicsObject:IsCollisionEnabled() end

--- Check if drag is enabled for the object.
---@return boolean True if drag is enabled
function IPhysicsObject:IsDragEnabled() end

--- Check if the object is in a fluid environment.
---@return boolean True if in fluid
function IPhysicsObject:IsFluid() end

--- Check if gravity is enabled for the object.
---@return boolean True if gravity is enabled
function IPhysicsObject:IsGravityEnabled() end

--- Check if the object is hinged.
---@return boolean True if hinged
function IPhysicsObject:IsHinged() end

--- Check if motion is enabled for the object.
---@return boolean True if motion is enabled
function IPhysicsObject:IsMotionEnabled() end

--- Check if the object is moveable.
---@return boolean True if moveable
function IPhysicsObject:IsMoveable() end

--- Check if the object is static (non-moveable).
---@return boolean True if static
function IPhysicsObject:IsStatic() end

--- Check if the object is a trigger.
---@return boolean True if a trigger
function IPhysicsObject:IsTrigger() end

--- Convert a local position to world space.
---@param localPos Vector Local position
---@return Vector World position
function IPhysicsObject:LocalToWorld(localPos) end

--- Convert a local vector to world space.
---@param localVec Vector Local vector
---@return Vector World vector
function IPhysicsObject:LocalToWorldVector(localVec) end

--- Output debug information about the object.
function IPhysicsObject:OutputDebugInfo() end

--- Recheck the collision filter for the object.
function IPhysicsObject:RecheckCollisionFilter() end

--- Recheck contact points for the object.
function IPhysicsObject:RecheckContactPoints() end

--- Remove the hinged state from the object.
function IPhysicsObject:RemoveHinged() end

--- Remove the shadow controller from the object.
function IPhysicsObject:RemoveShadowController() end

--- Remove the trigger state from the object.
function IPhysicsObject:RemoveTrigger() end

--- Set the buoyancy ratio for the object.
---@param ratio number Buoyancy ratio
function IPhysicsObject:SetBuoyancyRatio(ratio) end

--- Set callback flags for the object.
---@param flags integer Callback flags
function IPhysicsObject:SetCallbackFlags(flags) end

--- Set the contents mask for the object.
---@param contents integer Contents mask
function IPhysicsObject:SetContents(contents) end

--- Set drag coefficients for linear and angular motion.
---@param drag number Linear drag coefficient
---@param angularDrag number Angular drag coefficient
function IPhysicsObject:SetDragCoefficient(drag, angularDrag) end

--- Set game-specific flags for the object.
---@param flags integer Game flags
function IPhysicsObject:SetGameFlags(flags) end

--- Set the game-specific index for the object.
---@param index integer Game index
function IPhysicsObject:SetGameIndex(index) end

--- Set the mass of the object.
---@param mass number Mass
function IPhysicsObject:SetMass(mass) end

--- Set the material index for the object.
---@param index integer Material index
function IPhysicsObject:SetMaterialIndex(index) end

--- Set shadow controller parameters for the object.
---@param maxSpeed number Maximum speed
---@param maxAngular number Maximum angular speed
---@param allowPhysicsMovement boolean Allow physics-based movement
---@param allowPhysicsRotation boolean Allow physics-based rotation
function IPhysicsObject:SetShadow(maxSpeed, maxAngular, allowPhysicsMovement, allowPhysicsRotation) end

--- Set the velocity and angular velocity of the object.
---@param velocity Vector Linear velocity
---@param angularVelocity Vector Angular velocity
function IPhysicsObject:SetVelocity(velocity, angularVelocity) end

--- Set the velocity and angular velocity instantly (no interpolation).
---@param velocity Vector Linear velocity
---@param angularVelocity Vector Angular velocity
function IPhysicsObject:SetVelocityInstantaneous(velocity, angularVelocity) end

--- Put the object to sleep (stop simulation).
function IPhysicsObject:Sleep() end

--- Wake the object (resume simulation).
function IPhysicsObject:Wake() end

--- Convert a world position to local space.
---@param worldPos Vector World position
---@return Vector Local position
function IPhysicsObject:WorldToLocal(worldPos) end

--- Convert a world vector to local space.
---@param worldVec Vector World vector
---@return Vector Local vector
function IPhysicsObject:WorldToLocalVector(worldVec) end

--- String representation of the IPhysicsObject.
---@return string
function IPhysicsObject:__tostring() end

--- Interface for accessing surface properties (e.g., material data).
---@class IPhysicsSurfaceProps
IPhysicsSurfaceProps = {}

--- Get physical parameters for a surface by index.
---@param surfaceIndex integer Surface index
---@return surfacephysicsparams_t Physics parameters
function IPhysicsSurfaceProps:GetPhysicsParameters(surfaceIndex) end

--- Get physics properties for a surface by index.
---@param surfaceIndex integer Surface index
---@return number density Surface density
---@return number thickness Surface thickness
---@return number friction Surface friction
---@return number elasticity Surface elasticity
function IPhysicsSurfaceProps:GetPhysicsProperties(surfaceIndex) end

--- Get the name of a surface property by index.
---@param surfaceIndex integer Surface index
---@return string Property name
function IPhysicsSurfaceProps:GetPropName(surfaceIndex) end

--- Get the string associated with a sound index.
---@param soundIndex integer Sound index
---@return string Sound string
function IPhysicsSurfaceProps:GetString(soundIndex) end

--- Get complete surface data by index.
---@param surfaceIndex integer Surface index
---@return surfacedata_t Surface data
function IPhysicsSurfaceProps:GetSurfaceData(surfaceIndex) end

--- Get the index of a surface property by name.
---@param propName string Property name
---@return integer Surface index
function IPhysicsSurfaceProps:GetSurfaceIndex(propName) end

--- Parse surface data from a file and text buffer.
---@param filename string File name
---@param text string Text buffer
---@return integer Result code
function IPhysicsSurfaceProps:ParseSurfaceData(filename, text) end

--- Get the total number of surface properties.
---@return integer Property count
function IPhysicsSurfaceProps:SurfacePropCount() end

--- String representation of the IPhysicsSurfaceProps.
---@return string
function IPhysicsSurfaceProps:__tostring() end

--- Global physics surface properties instance.
---@type IPhysicsSurfaceProps
physprops = {}

---@class QAngle
---@field x number # Pitch (or X) component
---@field y number # Yaw (or Y) component
---@field z number # Roll (or Z) component
QAngle = {}

---Create a new QAngle. Defaults to (0,0,0).
---@param x number|nil
---@param y number|nil
---@param z number|nil
---@return QAngle
function QAngle.QAngle(x, y, z) end

---Initialize angle components (mutates).
---@param x number
---@param y number
---@param z number
function QAngle:Init(x, y, z) end

---Mark as invalid.
function QAngle:Invalidate() end

---Return whether the angle contains valid finite components.
---@return boolean
function QAngle:IsValid() end

---Return vector length (treated as 3D vector of angles).
---@return number
function QAngle:Length() end

---Return squared length.
---@return number
function QAngle:LengthSqr() end

---Index metamethod: access x/y/z or methods.
---@param key string
---@return number|function
function QAngle:__index(key) end

---Newindex metamethod: assign x/y/z.
---@param key string
---@param value number
function QAngle:__newindex(key, value) end

---Return string representation of the angle.
---@return string
function QAngle:__tostring() end

---Equality (component-wise).
---@param a QAngle
---@param b QAngle
---@return boolean
function QAngle.__eq(a, b) end

---Addition (component-wise).
---@param a QAngle
---@param b QAngle
---@return QAngle
function QAngle.__add(a, b) end

---Subtraction (component-wise).
---@param a QAngle
---@param b QAngle
---@return QAngle
function QAngle.__sub(a, b) end

---Multiply angle by scalar.
---@param a QAngle
---@param s number
---@return QAngle
function QAngle.__mul(a, s) end

---Divide angle by scalar.
---@param a QAngle
---@param s number
---@return QAngle
function QAngle.__div(a, s) end

---Unary minus (negation).
---@param a QAngle
---@return QAngle
function QAngle.__unm(a) end

-- Common global constant
---@type QAngle
vec3_angle = nil -- global QAngle constant (0,0,0)

---@class PlayerLocalData
---@field m_iHideHUD integer
---@field m_flFOVRate number
---@field m_bDucked boolean
---@field m_bDucking boolean
---@field m_bInDuckJump boolean
---@field m_flDucktime number
---@field m_flDuckJumpTime number
---@field m_flJumpTime number
---@field m_nStepside integer
---@field m_flFallVelocity number
---@field m_nOldButtons integer
---@field m_vecPunchAngle QAngle
---@field m_vecPunchAngleVel QAngle
---@field m_bDrawViewmodel boolean
---@field m_bWearingSuit boolean
---@field m_bPoisoned boolean
---@field m_flStepSize number
---@field m_bAllowAutoMovement boolean
---@field m_bSlowMovement boolean
PlayerLocalData = {}

---@class CBasePlayer : CBaseEntity
---@field m_afButtonLast integer
---@field m_afButtonPressed integer
---@field m_afButtonReleased integer
---@field m_flNextAttack number
---@field m_fOnTarget boolean
---@field m_nButtons integer
---@field m_StuckLast integer
---@field m_szAnimExtension string
---@field m_nTableReference integer
player = {}

-- Static helper to cast an entity to a player (returns nil if not player)
---@param ent CBaseEntity
---@return CBasePlayer
function player.ToBasePlayer(ent) end

---Abort weapon reload in progress for this player.
---@return nil
function player:AbortReload() end

---Add an entity to this player's simulation list (for prediction).
---@param ent CBaseEntity
---@return nil
function player:AddToPlayerSimulationList(ent) end

---Cache the vehicle view information for this player.
---@return nil
function player:CacheVehicleView() end

---Clear entities from this player's simulation list.
---@return nil
function player:ClearPlayerSimulationList() end

---Clear the zoom owner (stop zooming) for this player.
---@return nil
function player:ClearZoomOwner() end

---Return the current input command number for this player.
---@return integer
function player:CurrentCommandNumber() end

---Trigger a muzzle flash effect for this player's active weapon.
---@return nil
function player:DoMuzzleFlash() end

---Force the player to exit a ladder if currently on one.
---@return nil
function player:ExitLadder() end

---Get the player's eye angles (view orientation).
---@return QAngle
function player:EyeAngles() end

---Get the player's eye position (camera origin).
---@return Vector
function player:EyePosition() end

---Fill provided vectors with eye pos and direction vectors.
---@param forward Vector
---@param right Vector
---@param up Vector
---@param origin Vector
function player:EyePositionAndVectors(forward, right, up, origin) end

---Fill forward/right/up eye direction vectors into provided vectors.
---@param forward Vector
---@param right? Vector
---@param up? Vector
function player:EyeVectors(forward, right, up) end

---Return the entity this player is currently "using" (looking at/use target).
---@return CBaseEntity
function player:FindUseEntity() end

---Return the player's currently active weapon (combat weapon).
---@return CBaseCombatWeapon
function player:GetActiveWeapon() end

---Return the amount of ammo the player has for given index or name.
---@overload fun(self:CBasePlayer, ammoIndex:integer):integer
---@overload fun(self:CBasePlayer, ammoName:string):integer
---@param what any
---@return integer
function player:GetAmmoCount(what) end

---Snap the eye angles.
---@param what QAngle
function player:SnapEyeAngles(what) end

---Return an autoaim vector for the player given a maximum distance.
---@param maxDist number
---@return Vector
function player:GetAutoaimVector(maxDist) end

---Return the player's bonus challenge score (game-specific).
---@return integer
function player:GetBonusChallenge() end

---Return the player's bonus progress value.
---@return integer
function player:GetBonusProgress() end

---Return the time the player died (if dead).
---@return number
function player:GetDeathTime() end

---Return the player's default field-of-view.
---@return integer
function player:GetDefaultFOV() end

---Return the player's current field-of-view.
---@return number
function player:GetFOV() end

---Return factor used to adjust FOV over distance.
---@return number
function player:GetFOVDistanceAdjustFactor() end

---Return remaining time for an FOV transition.
---@return number
function player:GetFOVTime() end

---Return the player's current health.
---@return integer
function player:GetHealth() end

---Return the player's current impulse (game-specific).
---@return integer
function player:GetImpulse() end

---Return the player's lagged movement interpolation factor.
---@return number
function player:GetLaggedMovementValue() end

---Return the last known named place the player was in (map-specific).
---@return string
function player:GetLastKnownPlaceName() end

---Return the next time player can attack (server time).
---@return number
function player:GetNextAttack() end

---Return the player's observer mode (if spectating).
---@return integer
function player:GetObserverMode() end

---Return the entity the player is observing (if spectating).
---@return CBaseEntity
function player:GetObserverTarget() end

---Return offset index to the player's local data structure (internal).
---@return integer
function player.GetOffset_m_Local() end

---Return a table describing the player's local prediction data.
---@return PlayerLocalData
function player:GetPlayerLocalData() end

---Return the player's maximum collision bounds (maxs).
---@return Vector
function player:GetPlayerMaxs() end

---Return the player's minimum collision bounds (mins).
---@return Vector
function player:GetPlayerMins() end

---Return the player's name (display name).
---@return string
function player:GetPlayerName() end

---Return the last predicted origin used for movement prediction.
---@return Vector
function player:GetPreviouslyPredictedOrigin() end

---Return the player's current punch angle (view recoil) as a QAngle.
---@return QAngle
function player:GetPunchAngle() end

---Return a table containing the player's step sound cache entries.
---@return table
function player:GetStepSoundCache() end

---Return walk/run velocity thresholds used for step sounds.
---@return number, number
function player:GetStepSoundVelocities() end

---Return the player's swim sound timer value.
---@return number
function player:GetSwimSoundTime() end

---Return the player's timebase used for client predictions.
---@return number
function player:GetTimeBase() end

---Return tracer type string for bullets fired by this player.
---@return string
function player:GetTracerType() end

---Return the entity this player would "use" (secondary concept).
---@return CBaseEntity
function player:GetUseEntity() end

---Return an integer user id for this player (server-assigned).
---@return integer
function player:GetUserID() end

---Return the player's viewmodel instance (client-side object).
---@param index? integer
---@return any
function player:GetViewModel(index) end

---Return the player's water-jump timer value.
---@return number
function player:GetWaterJumpTime() end

---Return a weapon object by inventory slot.
---@param slot integer
---@return CBaseCombatWeapon
function player:GetWeapon(slot) end

---Send a hint/message string to the player's HUD.
---@param text string
---@return nil
function player:HintMessage(text) end

---Return true if this player is an AI bot.
---@return boolean
function player:IsBot() end

---Return true if this player is an HLTV (spectator) client.
---@return boolean
function player:IsHLTV() end

---Return true if player is in a vehicle.
---@return boolean
function player:IsInAVehicle() end

---Return true if player is in observer mode.
---@return boolean
function player:IsObserver() end

---Return true if object is a player (should always be true here).
---@return boolean
function player:IsPlayer() end

---Return true if player is currently underwater.
---@return boolean
function player:IsPlayerUnderwater() end

---Return true if the player has a suit equipped (game-specific).
---@return boolean
function player:IsSuitEquipped() end

---Return true if the given entity is usable by the player.
---@param ent CBaseEntity
---@param flags integer
---@return boolean
function player:IsUseableEntity(ent, flags) end

---Called each frame for the currently-held item (post-frame hooks).
---@return nil
function player:ItemPostFrame() end

---Called each frame before item logic (pre-frame hooks).
---@return nil
function player:ItemPreFrame() end

---Force the player to leave a vehicle (if in one).
---@return nil
function player:LeaveVehicle() end

---Return the player's local eye angles (client-side variant).
---@return QAngle
function player:LocalEyeAngles() end

---Return the player's maximum allowed movement speed.
---@return number
function player:MaxSpeed() end

---Return a pointer to the player's combat character (if applicable).
---@return CBasePlayer
function player:MyCombatCharacterPointer() end

---Called when the player is restored from a saved game or similar.
---@return nil
function player:OnRestore() end

---Run physics simulation logic for the player (server-side).
---@return nil
function player:PhysicsSimulate() end

---Return the physics solid mask used for this player.
---@return integer
function player:PhysicsSolidMaskForEntity() end

---Trigger player-use action (engine-provided).
---@return nil
function player:PlayerUse() end

---Play a footstep sound for this player (wrapper).
---@return nil
function player:PlayStepSound(...) end

---Called after the player's Think() for final frame updates.
---@return nil
function player:PostThink() end

---Called before the player's Think() to prepare input/state.
---@return nil
function player:PreThink() end

---Remove all ammo types from the player's inventory.
---@return nil
function player:RemoveAllAmmo() end

---Remove a quantity of ammo (by type index or name).
---@overload fun(self:CBasePlayer, amount:integer, typeIndex:integer)
---@overload fun(self:CBasePlayer, amount:integer, typeName:string)
---@param a any
---@param b any
function player:RemoveAmmo(a, b) end

---Remove an entity from the player's simulation list.
---@param ent CBaseEntity
---@return nil
function player:RemoveFromPlayerSimulationList(ent) end

---Reset the player's autoaim state.
---@return nil
function player:ResetAutoaim() end

---Reset observer mode for this player (if spectating).
---@return nil
function player:ResetObserverMode() end

---Select a named item in the player's inventory (by slot optional).
---@param name string
---@param slot? integer
---@return nil
function player:SelectItem(name, slot) end

---Select the last held item (weapon) for this player.
---@return nil
function player:SelectLastItem() end

---Set the player's ammo count for a slot/type.
---@param ammoIndex integer
---@param count integer
---@return nil
function player:SetAmmoCount(ammoIndex, count) end

---Set the player's animation state.
---@param anim integer
---@return nil
function player:SetAnimation(anim) end

---Set an animation extension string used by the player.
---@param ext string
---@return nil
function player:SetAnimationExtension(ext) end

---Set the player's blood color (used for decals/effects).
---@param color integer
---@return nil
function player:SetBloodColor(color) end

---Set the player's FOV targeting a certain entity (returns success).
---@param targetEnt CBaseEntity
---@param fov integer
---@param time number
---@param something? integer
---@return boolean
function player:SetFOV(targetEnt, fov, time, something) end

---Set the normal vector for ladder handling.
---@param normal Vector
---@return nil
function player:SetLadderNormal(normal) end

---Set the maximum movement speed for the player.
---@param speed number
---@return nil
function player:SetMaxSpeed(speed) end

---Set the next time the player can attack.
---@param nextAttack number
---@return nil
function player:SetNextAttack(nextAttack) end

---Set a field on the player's m_Local data (various client-predicted fields).
---@param field string
---@param value any
---@return nil
function player:SetPlayerLocalData(field, value) end

---Toggle whether the player is underwater for logic purposes.
---@param underwater boolean
---@return nil
function player:SetPlayerUnderwater(underwater) end

---Set previously predicted origin (for corrections/prediction).
---@param origin Vector
---@return nil
function player:SetPreviouslyPredictedOrigin(origin) end

---Set the player's view punch (recoil) angle.
---@param ang QAngle
---@return nil
function player:SetPunchAngle(ang) end

---Set or modify a step-sound cache entry for the player.
---@param index integer
---@param field string
---@param value any
---@return integer
function player:SetStepSoundCache(index, field, value) end

---Queue a suit voice update message for the player.
---@param msg string
---@param type integer
---@param delays integer
---@return nil
function player:SetSuitUpdate(msg, type, delays) end

---Set the swim sound timer for the player.
---@param t number
---@return nil
function player:SetSwimSoundTime(t) end

---Set the water-jump timer for the player.
---@param t number
---@return nil
function player:SetWaterJumpTime(t) end

---Shared spawn logic for both client and server initialisation.
---@return nil
function player:SharedSpawn() end

---Return whether the player should see contextual hints.
---@return boolean
function player:ShouldShowHints() end

---Simulate entities flagged as simulated by this player.
---@return nil
function player:SimulatePlayerSimulatedEntities() end

---Smooth the player's view when stepping on stairs.
---@param stairsvec Vector
---@return nil
function player:SmoothViewOnStairs(stairsvec) end

---Spawn the player (server-side spawn logic).
---@return nil
function player:Spawn() end

---Switch to the next best weapon given current state.
---@param weapon CBaseCombatWeapon
---@return boolean
function player:SwitchToNextBestWeapon(weapon) end

---Update client-data structures (for networked clients).
---@return nil
function player:UpdateClientData() end

---Update underwater state and effects for the player.
---@return nil
function player:UpdateUnderwaterState() end

---Return whether standard map weapons are used when in a vehicle.
---@return boolean
function player:UsingStandardWeaponsInVehicle() end

---Apply a view punch (recoil) to the player's view.
---@param ang QAngle
---@return nil
function player:ViewPunch(ang) end

---Reset view punch effects over a period of time.
---@param fl number
---@return nil
function player:ViewPunchReset(fl) end

---Check if the player can switch to the specified weapon.
---@param weapon CBaseCombatWeapon
---@return boolean
function player:Weapon_CanSwitchTo(weapon) end

---Return whether the player owns a weapon of the given type name (or slot).
---@overload fun(self:CBasePlayer, typename:string, slot?:integer):CBaseCombatWeapon
---@param typename string
---@param slot? integer
---@return CBaseCombatWeapon
function player:Weapon_OwnsThisType(typename, slot) end

---Set the last used weapon for the player (internal tracking).
---@param weapon CBaseCombatWeapon
---@return nil
function player:Weapon_SetLast(weapon) end

---Return the position from which the player's weapon fires.
---@return Vector
function player:Weapon_ShootPosition() end

---Return whether this weapon should be selected for the player.
---@param weapon CBaseCombatWeapon
---@return boolean
function player:Weapon_ShouldSelectItem(weapon) end

---Return whether the current weapon should be set as the last weapon.
---@param cur CBaseCombatWeapon
---@param last CBaseCombatWeapon
---@return boolean
function player:Weapon_ShouldSetLast(cur, last) end

---Switch to a weapon (attempt to change active weapon).
---@param weapon CBaseCombatWeapon
---@param something? integer
---@return boolean
function player:Weapon_Switch(weapon, something) end

---Return how many weapons the player currently has.
---@return integer
function player:WeaponCount() end

-- metamethods
---Compare two players for equality (same underlying entity).
---@return boolean
function player.__eq(a, b) end

---Return a human-readable string for the player object.
---@return string
function player.__tostring() end

---@class trace_t
trace_t = {}

---@class IPhysicsObject
IPhysicsObject = {}

---@class EmitSound_t
EmitSound_t = {}

---@class CSoundParameters
CSoundParameters = {}

---@class FireBulletsInfo
FireBulletsInfo = {}

--- Represents a damage event with associated properties such as damage amount, type, and entities involved.
--- This class is used to manage damage calculations and interactions in the game.
---@class CTakeDamageInfo
CTakeDamageInfo = {}

--- Create a new CTakeDamageInfo instance with varying parameters based on input count.
--- Overloads:
--- - CTakeDamageInfo() -- Empty constructor, default values.
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, damage: number, damageType: integer, [custom: integer])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, weapon: CBaseEntity, damage: number, damageType: integer, [custom: integer])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, force: Vector, damagePos: Vector, damage: number, damageType: integer, [custom: integer], [ammoType: Vector])
--- - CTakeDamageInfo(inflictor: CBaseEntity, attacker: CBaseEntity, weapon: CBaseEntity, force: Vector, damagePos: Vector, damage: number, damageType: integer, [custom: integer], [ammoType: Vector])
---@param ... any
---@return CTakeDamageInfo
function CTakeDamageInfo.CTakeDamageInfo(...) end

--- Add a specified amount to the current damage value.
---@param damage number Amount to add to the damage
function CTakeDamageInfo:AddDamage(damage) end

--- Add a damage type flag to the existing damage types.
---@param damageType integer Damage type to add (bitflag)
function CTakeDamageInfo:AddDamageType(damageType) end

--- Adjust damage inflicted by a player based on the skill level.
function CTakeDamageInfo:AdjustPlayerDamageInflictedForSkillLevel() end

--- Adjust damage taken by a player based on the skill level.
function CTakeDamageInfo:AdjustPlayerDamageTakenForSkillLevel() end

--- Check if the base damage value is valid (finite and non-negative).
---@return boolean
function CTakeDamageInfo:BaseDamageIsValid() end

--- Copy the current damage value to the base damage field.
function CTakeDamageInfo:CopyDamageToBaseDamage() end

--- Get a debug string describing the damage type(s).
---@param damageType integer The damage type to describe
---@return string
function CTakeDamageInfo:DebugGetDamageTypeString(damageType) end

--- Get the name of the ammo type associated with this damage.
---@return string
function CTakeDamageInfo:GetAmmoName() end

--- Get the ammo type index associated with this damage.
---@return integer
function CTakeDamageInfo:GetAmmoType() end

--- Get the entity that caused the damage (attacker).
---@return CBaseEntity
function CTakeDamageInfo:GetAttacker() end

--- Get the base damage value (before modifications).
---@return number
function CTakeDamageInfo:GetBaseDamage() end

--- Get the current damage value.
---@return number
function CTakeDamageInfo:GetDamage() end

--- Get the custom damage identifier (game-specific).
---@return integer
function CTakeDamageInfo:GetDamageCustom() end

--- Get the force vector applied by this damage event.
---@return Vector
function CTakeDamageInfo:GetDamageForce() end

--- Get the position where the damage occurred.
---@return Vector
function CTakeDamageInfo:GetDamagePosition() end

--- Get the damage stats (additional flags or metadata).
---@return integer
function CTakeDamageInfo:GetDamageStats() end

--- Get the damage type flags.
---@return integer
function CTakeDamageInfo:GetDamageType() end

--- Get the entity that inflicted the damage (e.g., a projectile).
---@return CBaseEntity
function CTakeDamageInfo:GetInflictor() end

--- Get the maximum damage allowed for this event.
---@return number
function CTakeDamageInfo:GetMaxDamage() end

--- Get the reported position of the damage (may differ from actual position).
---@return Vector
function CTakeDamageInfo:GetReportedPosition() end

--- Get the weapon entity responsible for this damage, if any.
---@return CBaseEntity
function CTakeDamageInfo:GetWeapon() end

--- Scale the damage amount by a factor.
---@param scale number Scaling factor
function CTakeDamageInfo:ScaleDamage(scale) end

--- Scale the damage force vector by a factor.
---@param scale number Scaling factor
function CTakeDamageInfo:ScaleDamageForce(scale) end

--- Set the ammo type index for this damage event.
---@param ammoType integer Ammo type index
function CTakeDamageInfo:SetAmmoType(ammoType) end

--- Set the attacker entity for this damage event.
---@param attacker CBaseEntity The attacking entity
function CTakeDamageInfo:SetAttacker(attacker) end

--- Set the damage amount for this event.
---@param damage number Damage amount
function CTakeDamageInfo:SetDamage(damage) end

--- Set a custom damage identifier (game-specific).
---@param custom integer Custom damage identifier
function CTakeDamageInfo:SetDamageCustom(custom) end

--- Set the force vector for this damage event.
---@param force Vector Force vector
function CTakeDamageInfo:SetDamageForce(force) end

--- Set the position where the damage occurred.
---@param position Vector Damage position
function CTakeDamageInfo:SetDamagePosition(position) end

--- Set damage stats (additional flags or metadata).
---@param stats integer Damage stats
function CTakeDamageInfo:SetDamageStats(stats) end

--- Set the damage type flags for this event.
---@param damageType integer Damage type (bitflag)
function CTakeDamageInfo:SetDamageType(damageType) end

--- Set the inflictor entity (e.g., a projectile).
---@param inflictor CBaseEntity The inflicting entity
function CTakeDamageInfo:SetInflictor(inflictor) end

--- Set the maximum damage allowed for this event.
---@param maxDamage number Maximum damage
function CTakeDamageInfo:SetMaxDamage(maxDamage) end

--- Set the reported position for this damage event.
---@param position Vector Reported position
function CTakeDamageInfo:SetReportedPosition(position) end

--- Set the weapon entity responsible for this damage.
---@param weapon CBaseEntity The weapon entity
function CTakeDamageInfo:SetWeapon(weapon) end

--- Subtract a specified amount from the current damage value.
---@param damage number Amount to subtract
function CTakeDamageInfo:SubtractDamage(damage) end

--- String representation of the CTakeDamageInfo object.
---@return string
function CTakeDamageInfo:__tostring() end

--- Clear the accumulated multi-damage queue.
function ClearMultiDamage() end

--- Apply all queued multi-damage events to their targets.
function ApplyMultiDamage() end

--- Add a damage event to the multi-damage queue for an entity.
---@param info CTakeDamageInfo The damage information
---@param target CBaseEntity The target entity
function AddMultiDamage(info, target) end

--- Calculate the impulse scale for a given mass and desired speed.
---@param mass number Mass of the object
---@param desiredSpeed number Desired speed
---@return number
function ImpulseScale(mass, desiredSpeed) end

--- Calculate the damage force for an explosive attack.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the explosion
---@param scale number Scaling factor (default: 1.0)
function CalculateExplosiveDamageForce(info, dir, origin, scale) end

--- Calculate the damage force for a bullet attack.
---@param info CTakeDamageInfo Damage information
---@param bulletType integer Bullet type index
---@param dir Vector Direction of the bullet
---@param origin Vector Origin of the shot
---@param scale number Scaling factor (default: 1.0)
function CalculateBulletDamageForce(info, bulletType, dir, origin, scale) end

--- Calculate the damage force for a melee attack.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the melee hit
---@param scale number Scaling factor (default: 1.0)
function CalculateMeleeDamageForce(info, dir, origin, scale) end

--- Guess the damage force based on provided parameters.
---@param info CTakeDamageInfo Damage information
---@param dir Vector Direction of the force
---@param origin Vector Origin of the damage
---@param scale number Scaling factor (default: 1.0)
function GuessDamageForce(info, dir, origin, scale) end

---@class CRecipientFilter
CRecipientFilter = {}

---@class CBaseEntity
---@field m_bAllowPrecache boolean
---@field m_flAnimTime number
---@field m_flSimulationTime number
---@field m_flSpeed number
---@field m_iClassname string
---@field m_iHealth integer
---@field m_nLastThinkTick integer
---@field m_nModelIndex integer
---@field touchStamp integer
entity = {}

---Return the DLL type string (module type).
---@return string
function entity.GetDLLType() end

---Create an entity instance by class name (factory).
---@param name string
---@return CBaseEntity
function CreateEntityByName(name) end

---Try to find parameters for a sound name (fills CSoundParameters).
---@param soundName string
---@param soundParams CSoundParameters
---@return boolean, CSoundParameters
function entity.GetParametersForSound(soundName, soundParams) end

---Return the prediction player used by the engine (internal).
---@return CBasePlayer
function entity.GetPredictionPlayer() end

---Return the prediction RNG seed (internal).
---@return integer
function entity.GetPredictionRandomSeed() end

---Return whether absolute position queries are valid globally.
---@return boolean
function entity.IsAbsQueriesValid() end

---Return whether precaching is allowed in global context.
---@return boolean
function entity.IsPrecacheAllowed() end

---Return whether simulation alternates ticks (platform detail).
---@return boolean
function entity.IsSimulatingOnAlternateTicks() end

---Return true if running in server context.
---@return boolean
function entity.IsServer() end

---Activate the entity (call spawn/initialization hooks).
---@return nil
function entity:Activate() end

---Add a data object type to the entity (game-specific).
---@param t integer
function entity:AddDataObjectType(t) end

---Add rendering / simulation effects flags to the entity.
---@param effects integer
function entity:AddEffects(effects) end

---Add entity flags (EFlags) to this entity.
---@param eflags integer
function entity:AddEFlags(eflags) end

---Add a boolean flag to the entity bitmask.
---@param flag integer
function entity:AddFlag(flag) end

---Add solid flags that change collision behaviour.
---@param flags integer
function entity:AddSolidFlags(flags) end

---Apply an absolute velocity impulse (instant velocity change).
---@param impulse Vector
function entity:ApplyAbsVelocityImpulse(impulse) end

---Apply a local angular velocity impulse to the entity.
---@param angVel QAngle
function entity:ApplyLocalAngularVelocityImpulse(angVel) end

---Return true if the entity blocks line-of-sight.
---@return boolean
function entity:BlocksLOS() end

---Return the entity's blood color (for decal/particle logic).
---@return integer
function entity:BloodColor() end

---Return a bounding radius used for various proximity checks.
---@return number
function entity:BoundingRadius() end

---Change the team ID for this entity.
---@param team integer
function entity:ChangeTeam(team) end

---Clear all effects from the entity.
---@return nil
function entity:ClearEffects() end

---Clear entity flags.
---@return nil
function entity:ClearFlags() end

---Notify engine that collision rules have changed for this entity.
---@return nil
function entity:CollisionRulesChanged() end

---Compute absolute direction from local vector and store in dst.
---@param src Vector
---@param dst Vector
function entity:ComputeAbsDirection(src, dst) end

---Compute absolute position from local pos and store in dst.
---@param src Vector
---@param dst Vector
function entity:ComputeAbsPosition(src, dst) end

---Compute world-space bounding box for this entity.
---@param mins Vector
---@param maxs Vector
function entity:ComputeWorldSpaceSurroundingBox(mins, maxs) end

---Create a data object of the specified type for this entity.
---@param type integer
function entity:CreateDataObject(type) end

---Create a predicted entity by classname (prediction helper).
---@param name string
---@param spawnname string
---@param flags integer
---@param predicted boolean
---@return CBaseEntity
function entity.CreatePredictedEntityByName(name, spawnname, flags, predicted) end

---Initialize VPhysics for dynamic behaviours.
---@return boolean
function entity:CreateVPhysics() end

---Return a decal name appropriate for a damage hitgroup/model.
---@param hitgroup integer
---@param modelIndex integer
---@return string
function entity:DamageDecal(hitgroup, modelIndex) end

---Apply a decal trace to this entity.
---@param tr trace_t
---@param decalName string
function entity:DecalTrace(tr, decalName) end

---Destroy all data objects attached to this entity.
---@return nil
function entity:DestroyAllDataObjects() end

---Destroy a specific data object by id.
---@param id integer
function entity:DestroyDataObject(id) end

---Dispatch a trace-based damage attack to the entity.
---@param dmg CTakeDamageInfo
---@param dir Vector
---@param tr trace_t
function entity:DispatchTraceAttack(dmg, dir, tr) end

---Run impact effects for a trace hit on the entity.
---@param tr trace_t
---@param impactType integer
---@return nil
function entity:DoImpactEffect(tr, impactType) end

---Return the entity's ear position (sound/listening origin).
---@return Vector
function entity:EarPosition() end

-- EmitSound overloads: entity:EmitSound(name[, duration]) -> optionally returns duration
---@overload fun(self:CBaseEntity, soundName:string, duration?:number):number|nil
---@param ... any
function entity:EmitSound(...) end

-- Static-style emit functions for filters and recipients
---@overload fun(filter:CRecipientFilter, channel:integer, name:string)
---@overload fun(filter:CRecipientFilter, channel:integer, ep:EmitSound_t)
function entity.EmitSound(...) end

---Notify this entity it stopped contacting another entity's ground.
---@param other CBaseEntity
function entity:EndGroundContact(other) end

---Notify this entity it stopped touching another entity.
---@param other CBaseEntity
function entity:EndTouch(other) end

---Return this entity's engine entindex().
---@return integer
function entity:entindex() end

---Convert a local-space vector to world space using the entity transform.
---@param inVec Vector
---@param outVec Vector
function entity:EntityToWorldSpace(inVec, outVec) end

---Get the entity's eye angles (if it has eyes).
---@return QAngle
function entity:EyeAngles() end

---Get the entity's eye position (if applicable).
---@return Vector
function entity:EyePosition() end

---Fire bullets according to a FireBulletsInfo struct.
---@param info FireBulletsInfo
function entity:FireBullets(info) end

---Return the first child in the movement hierarchy for this entity.
---@return CBaseEntity
function entity:FirstMoveChild() end

---Start following another entity (attach following behaviour).
---@param other CBaseEntity
---@param follow boolean
function entity:FollowEntity(other, follow) end

---Expand a string for gendered variations (game-specific text macro).
---@param str string
---@return string
function entity:GenderExpandString(str) end

---Get absolute orientation angles.
---@return QAngle
function entity:GetAbsAngles() end

---Get absolute origin position.
---@return Vector
function entity:GetAbsOrigin() end

---Get absolute velocity vector.
---@return Vector
function entity:GetAbsVelocity() end

---Get the current animation time for this entity.
---@return number
function entity:GetAnimTime() end

---Get the base animating interface for advanced animation control.
---@return any
function entity:GetBaseAnimating() end

---Return this entity's underlying CBaseEntity (self).
---@return CBaseEntity
function entity:GetBaseEntity() end

---Return the base velocity applied to the entity.
---@return Vector
function entity:GetBaseVelocity() end

---Return whether the entity checks untouch events.
---@return boolean
function entity:GetCheckUntouch() end

---Return the classname string for this entity type.
---@return string
function entity:GetClassname() end

---Return the collision group the entity belongs to.
---@return integer
function entity:GetCollisionGroup() end

---Access a data object by id (implementation-specific).
---@param id integer
function entity:GetDataObject(id) end

---Return a debug-friendly name for this entity.
---@return string
function entity:GetDebugName() end

---Return the DLL type (static helper).
---@return string
function entity:GetDLLType() end

---Return an associated effect entity (if set).
---@return CBaseEntity
function entity:GetEffectEntity() end

---Return current effect flags.
---@return integer
function entity:GetEffects() end

---Return current entity flags (EFlags).
---@return integer
function entity:GetEFlags() end

---Return elasticity used in physics bounces.
---@return number
function entity:GetElasticity() end

---Return first think tick for scheduled think functions.
---@return integer
function entity:GetFirstThinkTick() end

---Return current flags bitmask.
---@return integer
function entity:GetFlags() end

---Return the entity being followed by this entity (if any).
---@return CBaseEntity
function entity:GetFollowedEntity() end

---Return gravity multiplier used by this entity.
---@return number
function entity:GetGravity() end

---Return the last ground change time for this entity.
---@return number
function entity:GetGroundChangeTime() end

---Return entity currently considered ground for this entity.
---@return CBaseEntity
function entity:GetGroundEntity() end

---Return the entity's current health (if applicable).
---@return integer
function entity:GetHealth() end

---Retrieve a keyvalue by name from the entity; returns success and the value.
---@param key string
---@return boolean, string
function entity:GetKeyValue(key) end

---Get the time of the last think call (optionally specific named think).
---@param name? string
---@return number
function entity:GetLastThink(name) end

---Get the tick number of the last think for a named context.
---@param name string
---@return integer
function entity:GetLastThinkTick(name) end

---Return local-space orientation angles.
---@return QAngle
function entity:GetLocalAngles() end

---Return local-space angular velocity.
---@return QAngle
function entity:GetLocalAngularVelocity() end

---Return local origin position.
---@return Vector
function entity:GetLocalOrigin() end

---Return local-space linear velocity.
---@return Vector
function entity:GetLocalVelocity() end

---Get the maximum health for the entity (if applicable).
---@return integer
function entity:GetMaxHealth() end

---Get the model index used by the entity.
---@return integer
function entity:GetModelIndex() end

---Get the model name (string) used by the entity.
---@return string
function entity:GetModelName() end

---Return the entity this one is parented to (if any).
---@return CBaseEntity
function entity:GetMoveParent() end

---Return the type of movement for the entity (MoveType enum).
---@return integer
function entity:GetMoveType() end

---Return the owner entity (who spawned/owns this entity).
---@return CBaseEntity
function entity:GetOwnerEntity() end

---Helper to get parameters for a sound name (wraps internal lookup).
---@param soundName string
---@param outType? string
---@return boolean, CSoundParameters
function entity.GetParametersForSound(soundName, outType) end

---Return the player used for prediction (if any).
---@return CBasePlayer
function entity:GetPredictionPlayer() end

---Return the integer RNG seed used for prediction.
---@return integer
function entity:GetPredictionRandomSeed() end

---If the entity has a Lua ref table attached, return it (or nil).
---@return table|nil
function entity:GetRefTable() end

---If this entity is simulated by a player, return that player.
---@return CBasePlayer
function entity:GetSimulatingPlayer() end

---Return the simulation time for the entity (seconds).
---@return number
function entity:GetSimulationTime() end

---Return the solid type for this entity.
---@return integer
function entity:GetSolid() end

---Return the solid flags mask for this entity.
---@return integer
function entity:GetSolidFlags() end

---Return duration of a sound name (helper).
---@param sound string
---@param sound2 string
---@return number
function entity.GetSoundDuration(sound, sound2) end

---Return the index used as sound source for this entity.
---@return integer
function entity:GetSoundSourceIndex() end

---Return the team number assigned to this entity.
---@return integer
function entity:GetTeamNumber() end

---Return the texture frame index for animated textures.
---@return integer
function entity:GetTextureFrameIndex() end

---Return the last touch trace for this entity (engine stored).
---@return trace_t
function entity:GetTouchTrace() end

---Return the tracer attachment number used for shooting effects.
---@return integer
function entity:GetTracerAttachment() end

---Return the tracer type string used by the entity.
---@return string
function entity:GetTracerType() end

---Return the forward/right/up vectors for the entity's orientation.
---@return Vector, Vector, Vector
function entity:GetVectors() end

---Return the view offset (camera offset) for this entity.
---@return Vector
function entity:GetViewOffset() end

---Return water immersion level for this entity.
---@return integer
function entity:GetWaterLevel() end

---Return type of water the entity is in (game-specific).
---@return integer
function entity:GetWaterType() end

---Return true if entity has a given data object type attached.
---@param type integer
---@return boolean
function entity:HasDataObjectType(type) end

---Return true if there are NPCs standing on this entity.
---@return boolean
function entity:HasNPCsOnIt() end

---Perform impact trace handling for a weapon/attack.
---@param tr trace_t
---@param type integer
function entity:ImpactTrace(tr, type) end

---Return whether two entities are on the same team.
---@param other CBaseEntity
---@return boolean
function entity:InSameTeam(other) end

---Return whether absolute position queries are valid for entities.
---@return boolean
function entity:IsAbsQueriesValid() end

---Return whether the entity is walkable by AI.
---@return boolean
function entity:IsAIWalkable() end

---Return whether the entity is alive (has health > 0).
---@return boolean
function entity:IsAlive() end

---Return whether the entity animates every tick (client-side).
---@return boolean
function entity:IsAnimatedEveryTick() end

---Return whether the entity is a base object (map/generic object).
---@return boolean
function entity:IsBaseObject() end

---Return whether the entity is a train entity base type.
---@return boolean
function entity:IsBaseTrain() end

---Return whether the entity is a BSP (world) model.
---@return boolean
function entity:IsBSPModel() end

---Return whether context is client.
---@return boolean
function entity:IsClient() end

---Return whether this entity is currently touching something.
---@return boolean
function entity:IsCurrentlyTouching() end

---Return whether the entity is dormant (not being networked).
---@return boolean
function entity:IsDormant() end

---Return whether a particular effect flag is active.
---@param effect integer
---@return boolean
function entity:IsEffectActive(effect) end

---Return whether a specific EFlag bit is set.
---@param eflag integer
---@return boolean
function entity:IsEFlagSet(eflag) end

---Return whether the entity is floating (physics).
---@return boolean
function entity:IsFloating() end

---Return whether the entity is following another entity.
---@return boolean
function entity:IsFollowingEntity() end

---Return whether the entity is inside world bounds.
---@return boolean
function entity:IsInWorld() end

---Return whether the entity is marked for deletion.
---@return boolean
function entity:IsMarkedForDeletion() end

---Return whether the entity is an NPC.
---@return boolean
function entity:IsNPC() end

---Return whether the entity is a player.
---@return boolean
function entity:IsPlayer() end

---Return whether the entity is simulated by player code.
---@return boolean
function entity:IsPlayerSimulated() end

---Return whether the entity is point-sized (no volume).
---@return boolean
function entity:IsPointSized() end

---Return whether the entity is allowed precache (static global).
---@return boolean
function entity:IsPrecacheAllowed() end

---Return whether the server context is active.
---@return boolean
function entity:IsServer() end

---Return whether entity is simulated every tick (physics).
---@return boolean
function entity:IsSimulatedEveryTick() end

---Return whether simulation alternates ticks globally.
---@return boolean
function entity:IsSimulatingOnAlternateTicks() end

---Return whether entity is considered solid.
---@return boolean
function entity:IsSolid() end

---Return whether a specific solid flag is set.
---@param flag integer
---@return boolean
function entity:IsSolidFlagSet(flag) end

---Return whether the entity can be stood upon.
---@return boolean
function entity:IsStandable() end

---Return whether the entity is transparent for rendering.
---@return boolean
function entity:IsTransparent() end

---Return whether the entity is considered a weapon.
---@return boolean
function entity:IsWeapon() end

---Generic KeyValue setter/reader helper exposed to Lua.
---@param key string
---@param value any
---@return boolean
function entity:KeyValue(key, value) end

---Return the eye angles relative to the entity's local space.
---@return QAngle
function entity:LocalEyeAngles() end

---Get the next move peer (movement link) for this entity.
---@return CBaseEntity
function entity:NextMovePeer() end

---Return capability flags that describe the object.
---@return integer
function entity:ObjectCaps() end

---Hook called when entity is restored from save / map load.
---@return nil
function entity:OnRestore() end

---Run any checks related to physics untouch events.
---@return nil
function entity:PhysicsCheckForEntityUntouch() end

---Check for water physics conditions (returns boolean).
---@return boolean
function entity:PhysicsCheckWater() end

---Handle water transition notifications for physics.
---@return nil
function entity:PhysicsCheckWaterTransition() end

---Handle a physics impact event against another entity.
---@param other CBaseEntity
---@param tr trace_t
function entity:PhysicsImpact(other, tr) end

---Mark two entities as touching in physics.
---@param other CBaseEntity
---@param tr trace_t
function entity:PhysicsMarkEntitiesAsTouching(other, tr) end

---Notify other systems that ground was removed from an entity (static helper).
---@param ent CBaseEntity
function entity.PhysicsNotifyOtherOfGroundRemoval(ent, other) end

---Notify other systems that an untouch occured (static helper).
---@param ent CBaseEntity
function entity.PhysicsNotifyOtherOfUntouch(ent, other) end

---Remove the physics ground list for an entity (static helper).
---@param ent CBaseEntity
function entity.PhysicsRemoveGroundList(ent) end

---Remove the physics touched list for an entity (static helper).
---@param ent CBaseEntity
function entity.PhysicsRemoveTouchedList(ent) end

---Perform per-entity physics simulation step.
---@return nil
function entity:PhysicsSimulate() end

---Get the physics mask used for collision for this entity.
---@return integer
function entity:PhysicsSolidMaskForEntity() end

---Begin ground contact simulation with another entity.
---@param other CBaseEntity
function entity:PhysicsStartGroundContact(other) end

---Precache assets referenced by this entity.
---@return nil
function entity:Precache() end

---Precache a model and return its index.
---@param model string
---@return integer
function entity.PrecacheModel(model) end

---Precache a script-defined sound and return its id.
---@param sound string
---@return integer
function entity.PrecacheScriptSound(sound) end

---Precache a sound file (returns success).
---@param sound string
---@return boolean
function entity.PrecacheSound(sound) end

---Hint the engine to prefetch a script sound (no return).
---@param sound string
---@return nil
function entity.PrefetchScriptSound(sound) end

---Hint the engine to prefetch a sound file (no return).
---@param sound string
---@return nil
function entity.PrefetchSound(sound) end

---Register a named think context and return its id.
---@param name string
---@return integer
function entity:RegisterThinkContext(name) end

---Remove this entity from the world (despawn/destruct).
---@return nil
function entity:Remove() end

---Remove all decals applied to this entity.
---@return nil
function entity:RemoveAllDecals() end

---Remove a data object type assignment.
---@param type integer
function entity:RemoveDataObjectType(type) end

---Remove effect flags from this entity.
---@param effects integer
function entity:RemoveEffects(effects) end

---Remove EFlags bits from this entity.
---@param eflags integer
function entity:RemoveEFlags(eflags) end

---Remove a flag bit from the entity.
---@param flag integer
function entity:RemoveFlag(flag) end

---Remove solid flags from the entity's collision mask.
---@param flags integer
function entity:RemoveSolidFlags(flags) end

---Set absolute orientation angles for this entity.
---@param ang QAngle
function entity:SetAbsAngles(ang) end

---Set absolute origin position for this entity.
---@param pos Vector
function entity:SetAbsOrigin(pos) end

---Globally enable/disable absolute query validity.
---@param allow boolean
function entity.SetAbsQueriesValid(allow) end

---Set absolute linear velocity for the entity.
---@param vel Vector
function entity:SetAbsVelocity(vel) end

---Enable or disable AI walkability on the entity.
---@param walkable boolean
function entity:SetAIWalkable(walkable) end

---Globally allow or disallow precaching.
---@param allow boolean
function entity.SetAllowPrecache(allow) end

---Force this entity to animate every tick.
---@param ticked boolean
function entity:SetAnimatedEveryTick(ticked) end

---Set the animation playback time for this entity.
---@param t number
function entity:SetAnimTime(t) end

---Set a base velocity applied to the entity each physics step.
---@param vel Vector
function entity:SetBaseVelocity(vel) end

---Set whether this entity blocks line-of-sight.
---@param blocks boolean
function entity:SetBlocksLOS(blocks) end

---Set whether the entity checks untouch events.
---@param check boolean
function entity:SetCheckUntouch(check) end

---Set an arbitrary classname string for this entity (rarely used).
---@param name string
function entity:SetClassname(name) end

---Set custom collision bounds (mins/maxs) for this entity.
---@param mins Vector
---@param maxs Vector
function entity:SetCollisionBounds(mins, maxs) end

---Set the collision group for this entity.
---@param group integer
function entity:SetCollisionGroup(group) end

---Assign an entity to be used for special effects.
---@param ent CBaseEntity
function entity:SetEffectEntity(ent) end

---Set effect flags (rendering/behaviour) to this entity.
---@param effects integer
function entity:SetEffects(effects) end

---Set entity flags (EFlags).
---@param eflags integer
function entity:SetEFlags(eflags) end

---Set friction coefficient for physics interactions.
---@param friction number
function entity:SetFriction(friction) end

---Set gravity multiplier for this entity.
---@param gravity number
function entity:SetGravity(gravity) end

---Set the time when the entity last changed ground.
---@param t number
function entity:SetGroundChangeTime(t) end

---Set which entity counts as ground beneath this entity.
---@param groundEnt CBaseEntity
function entity:SetGroundEntity(groundEnt) end

---Set the current health for this entity.
---@param hp integer
function entity:SetHealth(hp) end

---Set local-space orientation angles.
---@param ang QAngle
function entity:SetLocalAngles(ang) end

---Set local angular velocity.
---@param vel QAngle
function entity:SetLocalAngularVelocity(vel) end

---Set local origin position.
---@param pos Vector
function entity:SetLocalOrigin(pos) end

---Set local linear velocity.
---@param vel Vector
function entity:SetLocalVelocity(vel) end

---Set the model for this entity; client returns success boolean.
---@param model string
---@return boolean|nil
function entity:SetModel(model) end

---Set the entity's model index manually.
---@param idx integer
function entity:SetModelIndex(idx) end

---Set the entity's model name string (internal representation).
---@param name string
function entity:SetModelName(name) end

---Set move-collide behaviour (how the entity collides while moving).
---@param movecollide integer
function entity:SetMoveCollide(movecollide) end

---Set move type and optional move-collide for this entity.
---@param movetype integer
---@param movecollide? integer
function entity:SetMoveType(movetype, movecollide) end

---Schedule the next think time for the entity.
---@param t number
function entity:SetNextThink(t) end

---Set owner entity for ownership tracking.
---@param owner CBaseEntity
function entity:SetOwnerEntity(owner) end

---Parent this entity to another entity (attachment index optional).
---@param parent CBaseEntity
---@param attachment integer
function entity:SetParent(parent, attachment) end

---Mark this entity as simulated by the given player.
---@param player CBasePlayer
function entity:SetPlayerSimulated(player) end

---Make this entity eligible for prediction.
---@param eligible boolean
function entity:SetPredictionEligible(eligible) end

---Set the prediction player for static contexts (global).
---@param player CBasePlayer
function entity.SetPredictionPlayer(player) end

---Set the render color (r,g,b,a) for this entity.
---@param r number
---@param g number
---@param b number
---@param a number
function entity:SetRenderColor(r, g, b, a) end

---Set the render alpha (a) channel.
---@param a number
function entity:SetRenderColorA(a) end

---Set the B channel of the render color.
---@param b number
function entity:SetRenderColorB(b) end

---Set the G channel of the render color.
---@param g number
function entity:SetRenderColorG(g) end

---Set the R channel of the render color.
---@param r number
function entity:SetRenderColorR(r) end

---Toggle whether this entity is simulated every physics tick.
---@param simEveryTick boolean
function entity:SetSimulatedEveryTick(simEveryTick) end

---Set the simulation time value for this entity.
---@param t number
function entity:SetSimulationTime(t) end

---Set the collision size (mins/maxs) for this entity.
---@param mins Vector
---@param maxs Vector
function entity:SetSize(mins, maxs) end

---Set the entity's solid type enumeration.
---@param solidType integer
function entity:SetSolid(solidType) end

---Set the integer solid flags mask on the entity.
---@param flags integer
function entity:SetSolidFlags(flags) end

---Set the frame index used for texture animation on the model.
---@param idx integer
function entity:SetTextureFrameIndex(idx) end

---Set the view offset used by players/AI for camera height.
---@param offset Vector
function entity:SetViewOffset(offset) end

---Set the water immersion level for the entity.
---@param level integer
function entity:SetWaterLevel(level) end

---Set the water type the entity is in (game-specific id).
---@param waterType integer
function entity:SetWaterType(waterType) end

---Check whether two collision groups should collide.
---@param a integer
---@param b integer
---@return boolean
function entity:ShouldCollide(a, b) end

---Return whether the entity's physics should be saved.
---@return boolean
function entity:ShouldSavePhysics() end

---Spawn the entity into the world (call spawn hooks).
---@return nil
function entity:Spawn() end

---Notify start of ground contact with another entity.
---@param other CBaseEntity
function entity:StartGroundContact(other) end

---Notify start of touch with another entity.
---@param other CBaseEntity
function entity:StartTouch(other) end

---Stop following any entity (clear parent/following state).
---@return nil
function entity:StopFollowingEntity() end

---Call the entity's SUB_Remove() method (engine removal helper).
---@return nil
function entity:SUB_Remove() end

---Entity think callback (per-frame logical update).
---@return nil
function entity:Think() end

---Toggle a single flag bit on/off.
---@param flag integer
function entity:ToggleFlag(flag) end

---Generic touch handler called when entity collides/contacts others.
---@param other CBaseEntity
function entity:Touch(other) end

---Apply blood/decal effects from a damage trace (trace bleed helper).
---@param dmg number
---@param dir Vector
---@param tr trace_t
---@param hitgroup integer
function entity:TraceBleed(dmg, dir, tr, hitgroup) end

---Unset any player-simulated flag on the entity.
---@return nil
function entity:UnsetPlayerSimulated() end

---Update cleanup or network state when the entity is removed/updated.
---@return nil
function entity:UpdateOnRemove() end

---Destroy any VPhysics object associated with this entity.
---@return nil
function entity:VPhysicsDestroyObject() end

---Return the VPhysics object attached to this entity if any.
---@return IPhysicsObject
function entity:VPhysicsGetObject() end

---Return a table and count of physics objects attached to this entity.
---@return integer, table<number, IPhysicsObject>
function entity:VPhysicsGetObjectList() end

---Initialize normal vphysics object (dynamic) for the entity.
---@param solidType integer
---@param key integer
---@param static boolean
---@return IPhysicsObject
function entity:VPhysicsInitNormal(solidType, key, static) end

---Initialize a static vphysics object.
---@return IPhysicsObject
function entity:VPhysicsInitStatic() end

---Return true if this entity's vphysics material is flesh-like.
---@return boolean
function entity:VPhysicsIsFlesh() end

---Attach an IPhysicsObject to this entity.
---@param obj IPhysicsObject
function entity:VPhysicsSetObject(obj) end

---Update the attached physics object with new state from Lua.
---@param obj IPhysicsObject
function entity:VPhysicsUpdate(obj) end

---Wake any objects resting on this entity (physics).
---@return nil
function entity:WakeRestingObjects() end

---Return the world-aligned maximum extents for this entity's model.
---@return Vector
function entity:WorldAlignMaxs() end

---Return the world-aligned minimum extents for this entity's model.
---@return Vector
function entity:WorldAlignMins() end

---Return the world-aligned size (maxs - mins) for this entity.
---@return Vector
function entity:WorldAlignSize() end

---Return the world-space center point of this entity's model.
---@return Vector
function entity:WorldSpaceCenter() end

---Transform a vector from world space into entity local space.
---@param inVec Vector
---@param outVec Vector
function entity:WorldToEntitySpace(inVec, outVec) end

-- metamethods (for completeness)
---Equality metamethod for entities (same underlying pointer).
---@return boolean
function entity.__eq(a, b) end

---Tostring metamethod: human-friendly entity description.
---@return string
function entity.__tostring() end

---@class CHL2MP_Player : CBasePlayer
---@field m_nTableReference integer # Lua registry reference for per-entity table storage (LUA_NOREF when none)
---@field m_fNextThinkPushAway number|nil # (client-only) next time to push away other players (engine internal)
CHL2MP_Player = {}

---Create a ragdoll for this player on the client (client-side) or attempt server-side ragdoll creation.
---On client: returns the created viewmodel/animating object. On server: returns true/false success.
---@return CBaseAnimating|boolean
function CHL2MP_Player:BecomeRagdollOnClient() end

---Recalculate inverse-kinematics bone locks for animation smoothing.
---@param flTime number Time delta or frame time used for IK calculations
function CHL2MP_Player:CalculateIKLocks(flTime) end

---Calculate the player's view parameters.
---Fills and returns eye origin, eye angles, near/far clip planes and FOV.
---@return Vector eyeOrigin, QAngle eyeAngles, number zNear, number zFar, number fov
function CHL2MP_Player:CalcView() end

---Returns whether this player is currently allowed to sprint.
---@return boolean
function CHL2MP_Player:CanSprint() end

---Trigger a player animation event (wrapper for engine animation events).
---@param event integer The PlayerAnimEvent_t enum value
---@param data integer? Optional event data (e.g. weapon hold type)
function CHL2MP_Player:DoAnimationEvent(event, data) end

---Metamethod: index lookup for CHL2MP_Player (handled by engine bindings).
---@param key string
---@return any
function CHL2MP_Player:__index(key) end

---Metamethod: newindex (assign) for CHL2MP_Player (stores values in per-entity table).
---@param key string
---@param value any
function CHL2MP_Player:__newindex(key, value) end

---Metamethod: equality check for two CHL2MP_Player objects (same underlying entity).
---@param other CHL2MP_Player
---@return boolean
function CHL2MP_Player:__eq(other) end

---Metamethod: tostring representation for the player.
---@return string
function CHL2MP_Player:__tostring() end

---Static helper: cast a generic entity to CHL2MP_Player (returns nil if not a player).
---@param ent CBaseEntity
---@return CHL2MP_Player
function CHL2MP_Player.ToHL2MPPlayer(ent) end

---Converts a generic entity (CBaseEntity or derived) to CHL2MP_Player
---@param ent CBaseEntity|CBasePlayer
---@return CHL2MP_Player|nil
function ToHL2MPPlayer(ent) end

---@class CBaseCombatWeapon : CBaseEntity
---@field m_bAltFiresUnderwater boolean       # True if alt-fire works underwater
---@field m_bFireOnEmpty boolean              # True if weapon tries to fire when empty
---@field m_bFiresUnderwater boolean          # True if primary fire works underwater
---@field m_bInReload boolean                 # True while reloading
---@field m_bReloadsSingly boolean            # True if reloads one round at a time
---@field m_fFireDuration number              # Time the weapon is considered "firing"
---@field m_flNextEmptySoundTime number       # Next time to play empty-clip sound
---@field m_flNextPrimaryAttack number        # Next allowed primary attack time
---@field m_flNextSecondaryAttack number      # Next allowed secondary attack time
---@field m_flTimeWeaponIdle number           # Time when weapon will next be idle
---@field m_flUnlockTime number               # Time until weapon is unlocked
---@field m_fMaxRange1 number                 # Max range for primary fire (engine use)
---@field m_fMaxRange2 number                 # Max range for secondary fire (engine use)
---@field m_fMinRange1 number                 # Min range for primary fire (engine use)
---@field m_fMinRange2 number                 # Min range for secondary fire (engine use)
---@field m_iClip1 integer                    # Current primary clip count
---@field m_iClip2 integer                    # Current secondary clip count
---@field m_iPrimaryAmmoType integer          # Primary ammo type index
---@field m_iSecondaryAmmoType integer        # Secondary ammo type index
---@field m_iState integer                    # Internal weapon state
---@field m_iSubType integer                  # Weapon subtype (game-specific)
---@field m_iViewModelIndex integer           # Viewmodel index
---@field m_iWorldModelIndex integer          # World model index
---@field m_nViewModelIndex integer           # Alternate cached viewmodel index
CBaseCombatWeapon = {}

---Abort any reload in progress for this weapon.
function CBaseCombatWeapon:AbortReload() end

---Activate the weapon (called when given to a player).
function CBaseCombatWeapon:Activate() end

---Return the number of animations in the activity list for this weapon.
---@return integer
function CBaseCombatWeapon:ActivityListCount() end

---Return an activity override for a requested activity. Also sets `required` to whether the override is strict.
---@param activity integer
---@param required boolean|nil
---@return integer
function CBaseCombatWeapon:ActivityOverride(activity, required) end

---Apply view kick (recoil view punch) for this weapon.
function CBaseCombatWeapon:AddViewKick() end

---Return whether auto-switching away from this weapon is allowed.
---@return boolean
function CBaseCombatWeapon:AllowsAutoSwitchFrom() end

---Return whether auto-switching to this weapon is allowed.
---@return boolean
function CBaseCombatWeapon:AllowsAutoSwitchTo() end

---Calculate viewmodel bob amount for this weapon.
---@return number
function CBaseCombatWeapon:CalcViewmodelBob() end

---Return whether NPCs can pick this weapon up.
---@return boolean
function CBaseCombatWeapon:CanBePickedUpByNPCs() end

---Return whether the weapon can be selected by a player.
---@return boolean
function CBaseCombatWeapon:CanBeSelected() end

---Return whether weapon can be deployed right now.
---@return boolean
function CBaseCombatWeapon:CanDeploy() end

---Return whether weapon can be holstered right now.
---@return boolean
function CBaseCombatWeapon:CanHolster() end

---Return whether weapon can be lowered.
---@return boolean
function CBaseCombatWeapon:CanLower() end

---Internal check/restart reload logic (engine binding).
function CBaseCombatWeapon:CheckReload() end

---Return current primary clip count.
---@return integer
function CBaseCombatWeapon:Clip1() end

---Return current secondary clip count.
---@return integer
function CBaseCombatWeapon:Clip2() end

---Default deploy helper (sets models/animations).
---@param viewModel string
---@param worldModel string
---@param position integer
---@param animPrefix string
---@return boolean
function CBaseCombatWeapon:DefaultDeploy(viewModel, worldModel, position, animPrefix) end

---Default reload helper. Returns true if reload started/succeeded.
---@param maxClip1 integer
---@param maxClip2 integer
---@param anim integer
---@return boolean
function CBaseCombatWeapon:DefaultReload(maxClip1, maxClip2, anim) end

---Default touch handler when dropped in the world.
---@param ent CBaseEntity
function CBaseCombatWeapon:DefaultTouch(ent) end

---Deploy (draw) this weapon.
---@return boolean
function CBaseCombatWeapon:Deploy() end

---Show an alt-fire HUD hint (engine-managed).
function CBaseCombatWeapon:DisplayAltFireHudHint() end

---Show a reload HUD hint.
function CBaseCombatWeapon:DisplayReloadHudHint() end

---Drop the weapon into the world at the given velocity.
---@param velocity Vector
function CBaseCombatWeapon:Drop(velocity) end

---Finish reload (complete animation/effects).
function CBaseCombatWeapon:FinishReload() end

---Return current activity (animation state).
---@return integer
function CBaseCombatWeapon:GetActivity() end

---Return the animation prefix string used by this weapon.
---@return string
function CBaseCombatWeapon:GetAnimPrefix() end

---Return the bullet type index used by this weapon.
---@return integer
function CBaseCombatWeapon:GetBulletType() end

---Compute damage for a given range and damage type/index.
---@param range number
---@param someIndex integer
---@return number
function CBaseCombatWeapon:GetDamage(range, someIndex) end

---Return the name used in death notices for this weapon.
---@return string
function CBaseCombatWeapon:GetDeathNoticeName() end

---Return the default animation speed for this weapon.
---@return number
function CBaseCombatWeapon:GetDefaultAnimSpeed() end

---Return default clip count for primary ammo.
---@return integer
function CBaseCombatWeapon:GetDefaultClip1() end

---Return default clip count for secondary ammo.
---@return integer
function CBaseCombatWeapon:GetDefaultClip2() end

---Return draw animation activity id.
---@return integer
function CBaseCombatWeapon:GetDrawActivity() end

---Return weapon fire rate (rounds per second or engine-specific unit).
---@return number
function CBaseCombatWeapon:GetFireRate() end

---Return the ideal activity id for the current state.
---@return integer
function CBaseCombatWeapon:GetIdealActivity() end

---Return the ideal sequence id for the current activity.
---@return integer
function CBaseCombatWeapon:GetIdealSequence() end

---Return maximum auto-aim deflection allowed for this weapon.
---@return number
function CBaseCombatWeapon:GetMaxAutoAimDeflection() end

---Return maximum burst size for burst-fire weapons.
---@return integer
function CBaseCombatWeapon:GetMaxBurst() end

---Return maximum primary clip size.
---@return integer
function CBaseCombatWeapon:GetMaxClip1() end

---Return maximum secondary clip size.
---@return integer
function CBaseCombatWeapon:GetMaxClip2() end

---Return the maximum rest time between bursts.
---@return number
function CBaseCombatWeapon:GetMaxRestTime() end

---Return the minimum burst size.
---@return integer
function CBaseCombatWeapon:GetMinBurst() end

---Return the minimum rest time between bursts.
---@return number
function CBaseCombatWeapon:GetMinRestTime() end

---Return internal weapon name/classname.
---@return string
function CBaseCombatWeapon:GetName() end

---Return owner (player) of this weapon.
---@return CBasePlayer
function CBaseCombatWeapon:GetOwner() end

---Return weapon inventory/slot position.
---@return integer
function CBaseCombatWeapon:GetPosition() end

---Return current primary ammo count carried by the owner/player.
---@return integer
function CBaseCombatWeapon:GetPrimaryAmmoCount() end

---Return primary ammo type index.
---@return integer
function CBaseCombatWeapon:GetPrimaryAmmoType() end

---Return primary attack activity id.
---@return integer
function CBaseCombatWeapon:GetPrimaryAttackActivity() end

---Return the printed display name for the weapon.
---@return string
function CBaseCombatWeapon:GetPrintName() end

---Return a random burst count for burst-fire logic.
---@return integer
function CBaseCombatWeapon:GetRandomBurst() end

---Return rumble/vibration effect id for this weapon.
---@return integer
function CBaseCombatWeapon:GetRumbleEffect() end

---Return secondary ammo count carried by the owner.
---@return integer
function CBaseCombatWeapon:GetSecondaryAmmoCount() end

---Return secondary ammo type index.
---@return integer
function CBaseCombatWeapon:GetSecondaryAmmoType() end

---Return secondary attack activity id.
---@return integer
function CBaseCombatWeapon:GetSecondaryAttackActivity() end

---Get shoot sound for the given index/type.
---@param idx integer
---@return string
function CBaseCombatWeapon:GetShootSound(idx) end

---Return weapon slot index (UI grouping).
---@return integer
function CBaseCombatWeapon:GetSlot() end

---Return subtype value (game/mod specific).
---@return integer
function CBaseCombatWeapon:GetSubType() end

---Return viewmodel path for the weapon (optionally for a particular index).
---@param index integer?
---@return string
function CBaseCombatWeapon:GetViewModel(index) end

---Return duration of current viewmodel sequence.
---@return number
function CBaseCombatWeapon:GetViewModelSequenceDuration() end

---Return engine/internal weapon flags mask.
---@return integer
function CBaseCombatWeapon:GetWeaponFlags() end

---Return next idle time for this weapon.
---@return number
function CBaseCombatWeapon:GetWeaponIdleTime() end

---Return weight (selection priority) for this weapon.
---@return integer
function CBaseCombatWeapon:GetWeight() end

---Return world model path for this weapon.
---@return string
function CBaseCombatWeapon:GetWorldModel() end

---Return a table of weapon info (file-weapon info structure).
---@return table
function CBaseCombatWeapon:GetWpnData() end

---Give the weapon its default starting ammo.
function CBaseCombatWeapon:GiveDefaultAmmo() end

---Handle press/fire when clip is empty.
function CBaseCombatWeapon:HandleFireOnEmpty() end

---Return whether the weapon currently has any usable ammo.
---@return boolean
function CBaseCombatWeapon:HasAmmo() end

---Return whether the player has any ammo for this weapon at all.
---@return boolean
function CBaseCombatWeapon:HasAnyAmmo() end

---Return whether primary ammo is available.
---@return boolean
function CBaseCombatWeapon:HasPrimaryAmmo() end

---Return whether secondary ammo is available.
---@return boolean
function CBaseCombatWeapon:HasSecondaryAmmo() end

---Returns true if weapon idle timer has elapsed.
---@return boolean
function CBaseCombatWeapon:HasWeaponIdleTimeElapsed() end

---Periodic think used while weapon hidden.
function CBaseCombatWeapon:HideThink() end

---Return whether weapon is allowed to switch (internal rules).
---@return boolean
function CBaseCombatWeapon:IsAllowedToSwitch() end

---Return whether this weapon is locked against the given entity (owner/locker).
---@param ent CBaseEntity
---@return boolean
function CBaseCombatWeapon:IsLocked(ent) end

---Return whether this weapon is a melee weapon.
---@return boolean
function CBaseCombatWeapon:IsMeleeWeapon() end

---Return whether this weapon is predicted (client-side prediction).
---@return boolean
function CBaseCombatWeapon:IsPredicted() end

---Return whether this weapon is a scripted SWEP (scripted by game/mod).
---@return boolean
function CBaseCombatWeapon:IsScripted() end

---Return whether the current viewmodel sequence finished playing.
---@return boolean
function CBaseCombatWeapon:IsViewModelSequenceFinished() end

---Return whether the weapon is visible (owner has it shown).
---@return boolean
function CBaseCombatWeapon:IsWeaponVisible() end

---Return whether the weapon is zoomed (scoped).
---@return boolean
function CBaseCombatWeapon:IsWeaponZoomed() end

---Called while the item is busy (reloading, etc.).
function CBaseCombatWeapon:ItemBusyFrame() end

---Called each frame while the weapon is holstering.
function CBaseCombatWeapon:ItemHolsterFrame() end

---Called each frame the weapon is active.
function CBaseCombatWeapon:ItemPostFrame() end

---Called each pre-frame for the weapon.
function CBaseCombatWeapon:ItemPreFrame() end

---Lock the weapon for `time` and optionally associate `ent` as the locker.
---@param time number
---@param ent CBaseEntity
function CBaseCombatWeapon:Lock(time, ent) end

---Lower the weapon (put it away) if allowed.
---@return boolean
function CBaseCombatWeapon:Lower() end

---Maintain internal ideal activity transitions.
function CBaseCombatWeapon:MaintainIdealActivity() end

---Called when an active state changes (engine notifications).
---@param state integer
function CBaseCombatWeapon:OnActiveStateChanged(state) end

---Restore weapon state after a save/load.
function CBaseCombatWeapon:OnRestore() end

---Precache models/sounds for this weapon.
function CBaseCombatWeapon:Precache() end

---Primary fire behavior (engine binding / override point).
function CBaseCombatWeapon:PrimaryAttack() end

---Return whether the weapon is ready to fire/use.
---@return boolean
function CBaseCombatWeapon:Ready() end

---Attempt to reload the weapon.
---@return boolean
function CBaseCombatWeapon:Reload() end

---Reload or switch weapons depending on ammo (helper).
---@return boolean
function CBaseCombatWeapon:ReloadOrSwitchWeapons() end

---Rescind alt-fire HUD hint.
function CBaseCombatWeapon:RescindAltFireHudHint() end

---Rescind reload HUD hint.
function CBaseCombatWeapon:RescindReloadHudHint() end

---Secondary fire behavior (engine binding / override point).
function CBaseCombatWeapon:SecondaryAttack() end

---Send a viewmodel animation id to the viewmodel.
---@param anim integer
function CBaseCombatWeapon:SendViewModelAnim(anim) end

---Send a weapon animation and return success.
---@param anim integer
---@return boolean
function CBaseCombatWeapon:SendWeaponAnim(anim) end

---Set the current activity.
---@param activity integer
function CBaseCombatWeapon:SetActivity(activity) end

---Set the ideal activity and return whether it changed.
---@param activity integer
---@return boolean
function CBaseCombatWeapon:SetIdealActivity(activity) end

---Enable pickup touch so players can pick it up.
function CBaseCombatWeapon:SetPickupTouch() end

---Set primary ammo count in the clip.
---@param count integer
function CBaseCombatWeapon:SetPrimaryAmmoCount(count) end

---Set secondary ammo count in the clip.
---@param count integer
function CBaseCombatWeapon:SetSecondaryAmmoCount(count) end

---Set weapon subtype value.
---@param subtype integer
function CBaseCombatWeapon:SetSubType(subtype) end

---Set viewmodel path (engine-managed).
function CBaseCombatWeapon:SetViewModel() end

---Set active viewmodel index (for multiple viewmodels).
---@param index integer
function CBaseCombatWeapon:SetViewModelIndex(index) end

---Set the next time the weapon will be idle.
---@param t number
function CBaseCombatWeapon:SetWeaponIdleTime(t) end

---Show or hide weapon visuals for the owner.
---@param visible boolean
function CBaseCombatWeapon:SetWeaponVisible(visible) end

---Return whether alt-fire HUD hint should be displayed.
---@return boolean
function CBaseCombatWeapon:ShouldDisplayAltFireHUDHint() end

---Return whether reload HUD hint should be displayed.
---@return boolean
function CBaseCombatWeapon:ShouldDisplayReloadHUDHint() end

---Return whether control panels should be shown for this weapon.
---@return boolean
function CBaseCombatWeapon:ShouldShowControlPanels() end

---Spawn/respawn the weapon (world entity).
function CBaseCombatWeapon:Spawn() end

---Request the weapon to start sprinting (if it supports sprint).
---@return boolean
function CBaseCombatWeapon:StartSprinting() end

---Stop sprinting.
---@return boolean
function CBaseCombatWeapon:StopSprinting() end

---Stop a weapon sound of the given type.
---@param soundType integer
function CBaseCombatWeapon:StopWeaponSound(soundType) end

---Return whether primary ammo uses clips.
---@return boolean
function CBaseCombatWeapon:UsesClipsForAmmo1() end

---Return whether secondary ammo uses clips.
---@return boolean
function CBaseCombatWeapon:UsesClipsForAmmo2() end

---Return whether weapon uses primary ammo at all.
---@return boolean
function CBaseCombatWeapon:UsesPrimaryAmmo() end

---Return whether weapon uses secondary ammo at all.
---@return boolean
function CBaseCombatWeapon:UsesSecondaryAmmo() end

---Return whether the weapon should be visible in weapon selection UI.
---@return boolean
function CBaseCombatWeapon:VisibleInWeaponSelection() end

---Return weapon auto-aim scale.
---@return number
function CBaseCombatWeapon:WeaponAutoAimScale() end

---Per-frame weapon idle logic.
function CBaseCombatWeapon:WeaponIdle() end

---Play/trigger a weapon sound; variant with optional time argument.
---@param soundID integer
---@param time number?
function CBaseCombatWeapon:WeaponSound(soundID, time) end

---Return integer representing internal weapon state.
---@return integer
function CBaseCombatWeapon:WeaponState() end

-- metamethods
---@return boolean
function CBaseCombatWeapon.__eq(a, b) end

---@return string
function CBaseCombatWeapon.__tostring() end

--- Debugging library providing functions for logging and spew control.
--- @class dbg
dbg = {}

--- Activates spew output for a specific group with a given level.
--- @param group string The name of the spew group to activate.
--- @param level integer The verbosity level for spew output.
function dbg.SpewActivate(group, level) end

--- Checks if spew is active for a specific group and level.
--- @param group string The name of the spew group to check.
--- @param level integer The verbosity level to check.
--- @return boolean active Whether spew is active for the given group and level.
function dbg.IsSpewActive(group, level) return true end

--- Outputs a message to the console.
--- @param message string The message to output.
function dbg.Msg(message) end

--- Outputs a debug message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the message.
--- @param message string The debug message to output.
function dbg.DMsg(group, level, message) end

--- Outputs a warning message to the console.
--- @param message string The warning message to output.
function dbg.Warning(message) end

--- Outputs a debug warning message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the warning.
--- @param message string The warning message to output.
function dbg.DWarning(group, level, message) end

--- Outputs a log message to the console.
--- @param message string The log message to output.
function dbg.Log(message) end

--- Outputs a debug log message to the console if the specified level is active.
--- @param group string The name of the spew group.
--- @param level integer The verbosity level for the log.
--- @param message string The log message to output.
function dbg.DLog(group, level, message) end

--- Outputs an error message to the console and potentially halts execution.
--- @param message string The error message to output.
function dbg.Error(message) end

--- Outputs a developer message to the console.
--- @param message string The developer message to output.
function dbg.DevMsg(message) end

--- Outputs a developer warning message to the console.
--- @param message string The developer warning message to output.
function dbg.DevWarning(message) end

--- Outputs a developer log message to the console.
--- @param message string The developer log message to output.
function dbg.DevLog(message) end

--- Outputs a colored message to the console.
--- @param color table The color table (typically containing RGB values).
--- @param message string The message to output in color.
function dbg.ConColorMsg(color, message) end

--- Outputs a console message.
--- @param message string The console message to output.
function dbg.ConMsg(message) end

--- Outputs a console warning message.
--- @param message string The console warning message to output.
function dbg.ConWarning(message) end

--- Outputs a console log message.
--- @param message string The console log message to output.
function dbg.ConLog(message) end

--- Outputs a colored debug message to the console if the specified level is active.
--- @param color table The color table (typically containing RGB values).
--- @param message string The debug message to output in color.
function dbg.ConDColorMsg(color, message) end

--- Outputs a debug console message if the specified level is active.
--- @param message string The debug console message to output.
function dbg.ConDMsg(message) end

--- Outputs a debug console warning message if the specified level is active.
--- @param message string The debug console warning message to output.
function dbg.ConDWarning(message) end

--- Outputs a debug console log message if the specified level is active.
--- @param message string The debug console log message to output.
function dbg.ConDLog(message) end

--- Outputs a network message with a specified channel.
--- @param channel integer The network channel for the message.
--- @param message string The network message to output.
function dbg.NetMsg(channel, message) end

--- Outputs a network warning message with a specified channel.
--- @param channel integer The network channel for the warning.
--- @param message string The network warning message to output.
function dbg.NetWarning(channel, message) end

--- Outputs a network log message with a specified channel.
--- @param channel integer The network channel for the log.
--- @param message string The network log message to output.
function dbg.NetLog(channel, message) end

--- Color library providing functions and methods for handling RGBA colors.
--- @class Color
Color = {}

--- Creates a new Color object with the specified RGBA values.
--- @param r integer Red component (0-255).
--- @param g integer Green component (0-255).
--- @param b integer Blue component (0-255).
--- @param a? integer Alpha component (0-255, defaults to 255).
--- @return table color A Color object.
function Color.Color(r, g, b, a) end

--- Gets the alpha component of the color.
--- @return integer alpha The alpha value (0-255).
function Color:a() end

--- Gets the blue component of the color.
--- @return integer blue The blue value (0-255).
function Color:b() end

--- Gets the green component of the color.
--- @return integer green The green value (0-255).
function Color:g() end

--- Gets the RGBA components of the color.
--- @return integer r The red value (0-255).
--- @return integer g The green value (0-255).
--- @return integer b The blue value (0-255).
--- @return integer a The alpha value (0-255).
function Color:GetColor() end

--- Gets the raw color value as a single integer.
--- @return integer rawColor The raw color value.
function Color:GetRawColor() end

--- Gets the red component of the color.
--- @return integer red The red value (0-255).
function Color:r() end

--- Sets the RGBA components of the color.
--- @param r integer Red component (0-255).
--- @param g integer Green component (0-255).
--- @param b integer Blue component (0-255).
--- @param a? integer Alpha component (0-255, defaults to 255).
function Color:SetColor(r, g, b, a) end

--- Sets the raw color value as a single integer.
--- @param rawColor integer The raw color value.
function Color:SetRawColor(rawColor) end

--- Returns a string representation of the color in the format "(r, g, b, a)".
--- @return string str The string representation of the color.
function Color:__tostring() end

--- Checks if two Color objects are equal.
--- @param other table Another Color object to compare with.
--- @return boolean equal Whether the two colors are equal.
function Color:__eq(other) end

--- Prints one or more values to the console, separated by tabs, followed by a newline.
--- Converts each value to a string using the global `tostring` function.
--- @param ... any Values to print.
function print(...) end

--- Returns the type of a value, either as a Lua type or a custom metatable `__type` if defined.
--- @param value any The value to check the type of.
--- @return string type The type name of the value (e.g., "number", "string", or custom metatable `__type`).
function type(value) end

--- Includes and executes a Lua file relative to the caller's source file path.
--- The file path is constructed by combining the directory of the calling script with the provided filename.
--- @param filename string The name of the Lua file to include (relative to the caller's directory).
function include(filename) end

---@class GMTable
---@field Name string The name of the gamemode
---@field Developer string The developer or team
---@field Homepage string Gamemode homepage URL
---@field Manual string? Optional manual path
---@field BaseClass GMTable? The parent gamemode table, used to call original functions
GM = {}

---Called when the gamemode is initialized.
function GM:Initialize() end

---Gives the default items to a player.
---@param pPlayer CBasePlayer
function GM:GiveDefaultItems(pPlayer) end

---Called when a player selects a spawn point.
---@param pPlayer CBasePlayer
---@return CBaseEntity
function GM:PlayerEntSelectSpawnPoint(pPlayer) end

---Determines if a weapon should respawn.
---@param pWeapon CBaseCombatWeapon
---@return boolean
function GM:WeaponShouldRespawn(pWeapon) end

---Determines if an item should respawn.
---@param pItem CBaseEntity
---@return boolean
function GM:ItemShouldRespawn(pItem) end

---Called when a player tries to pick up an object.
---@param pPlayer CBasePlayer
---@param pObject CBaseEntity
---@param bLimitMassAndSize boolean
function GM:PlayerPickupObject(pPlayer, pObject, bLimitMassAndSize) end

---@class gEntList
gEntList = {}

---Cleans up the delete list
function gEntList:CleanupDeleteList() end

---Clears all entities
function gEntList:Clear() end

---Finds an entity by classname
---@param ent CBaseEntity? The entity to start searching from, or nil
---@param classname string
---@return CBaseEntity?
function gEntList:FindEntityByClassname(ent, classname) end

---Finds the nearest entity of a given classname
---@param classname string
---@param pos Vector
---@param radius number
---@return CBaseEntity?
function gEntList:FindEntityByClassnameNearest(classname, pos, radius) end

---Finds an entity by name
---@param ent CBaseEntity? Starting entity
---@param name string
---@param opt1 CBaseEntity?
---@param opt2 CBaseEntity?
---@param opt3 CBaseEntity?
---@return CBaseEntity?
function gEntList:FindEntityByName(ent, name, opt1, opt2, opt3) end

---Returns the first entity in the list
---@return CBaseEntity?
function gEntList:FirstEnt() end

---Returns the next entity after the given one
---@param ent CBaseEntity
---@return CBaseEntity?
function gEntList:NextEnt(ent) end

---Number of active edicts
---@return number
function gEntList:NumberOfEdicts() end

---Number of entities
---@return number
function gEntList:NumberOfEntities() end

---Checks if entities are being cleared
---@return boolean
function gEntList:IsClearingEntities() end

---Notify entity creation
---@param ent CBaseEntity
function gEntList:NotifyCreateEntity(ent) end

---Notify entity spawn
---@param ent CBaseEntity
function gEntList:NotifySpawn(ent) end

---Reset delete list and returns number of items cleared
---@return number
function gEntList:ResetDeleteList() end

---Report entity flags changed
---@param ent CBaseEntity
---@param oldFlags number
---@param newFlags number
function gEntList:ReportEntityFlagsChanged(ent, oldFlags, newFlags) end

--- CBaseAnimating library providing methods for manipulating animating entities.
--- @class CBaseAnimating
CBaseAnimating = {}

--- Adds the entity to the game world.
function CBaseAnimating:AddEntity() end

--- Adds the entity to the client-side animation list.
function CBaseAnimating:AddToClientSideAnimationList() end

--- Converts the entity to a ragdoll on the client.
--- @return CBaseAnimating ragdoll The resulting ragdoll entity.
function CBaseAnimating:BecomeRagdollOnClient() end

--- Calculates inverse kinematics (IK) locks for the entity at a given time.
--- @param currentTime number The current time for IK calculations.
function CBaseAnimating:CalculateIKLocks(currentTime) end

--- Clamps the animation cycle value.
--- @param cycle number The cycle value to clamp.
--- @param isLooping boolean Whether the sequence is looping.
--- @return number clampedCycle The clamped cycle value.
function CBaseAnimating:ClampCycle(cycle, isLooping) end

--- Clears the entity's animation state.
function CBaseAnimating:Clear() end

--- Clears the entity's ragdoll state.
function CBaseAnimating:ClearRagdoll() end

--- Notifies the entity of a client-side animation change.
function CBaseAnimating:ClientSideAnimationChanged() end

--- Computes flags for client-side animation.
--- @return integer flags The computed animation flags.
function CBaseAnimating:ComputeClientSideAnimationFlags() end

--- Computes the entity-space hitbox surrounding box.
--- @return boolean success Whether the computation was successful.
--- @return Vector mins The minimum bounds of the hitbox.
--- @return Vector maxs The maximum bounds of the hitbox.
function CBaseAnimating:ComputeEntitySpaceHitboxSurroundingBox() end

--- Computes the world-space hitbox surrounding box.
--- @return boolean success Whether the computation was successful.
--- @return Vector mins The minimum bounds of the hitbox.
--- @return Vector maxs The maximum bounds of the hitbox.
function CBaseAnimating:ComputeHitboxSurroundingBox() end

--- Creates a copy of the entity as a ragdoll.
--- @return CBaseAnimating ragdoll The created ragdoll entity.
function CBaseAnimating:CreateRagdollCopy() end

--- Creates unragdoll information from another animating entity.
--- @param other CBaseAnimating The source animating entity.
function CBaseAnimating:CreateUnragdollInfo(other) end

--- Disables the muzzle flash effect.
function CBaseAnimating:DisableMuzzleFlash() end

--- Dispatches a muzzle effect.
--- @param effectName string The name of the muzzle effect.
--- @param isFirstPerson boolean Whether the effect is in first-person view.
--- @return boolean success Whether the effect was dispatched successfully.
function CBaseAnimating:DispatchMuzzleEffect(effectName, isFirstPerson) end

--- Triggers a muzzle flash effect.
function CBaseAnimating:DoMuzzleFlash() end

--- Draws client-side hitboxes for debugging.
--- @param duration? number Duration to display hitboxes (default: 0.0).
--- @param monoColor? boolean Whether to use a single color (default: false).
function CBaseAnimating:DrawClientHitboxes(duration, monoColor) end

--- Draws the entity's model with specified flags.
--- @param flags integer The draw flags.
--- @return integer result The result of the draw operation.
function CBaseAnimating:DrawModel(flags) end

--- Finds a bodygroup by its name.
--- @param name string The name of the bodygroup.
--- @return integer bodygroupId The ID of the bodygroup, or -1 if not found.
function CBaseAnimating:FindBodygroupByName(name) end

--- Finds the entity being followed by this entity.
--- @return CBaseAnimating entity The followed entity, or nil if none.
function CBaseAnimating:FindFollowedEntity() end

--- Finds a transition sequence between two sequences.
--- @param currentSequence integer The current sequence ID.
--- @param goalSequence integer The target sequence ID.
--- @return integer sequenceId The transition sequence ID.
--- @return integer direction The direction of the transition.
function CBaseAnimating:FindTransitionSequence(currentSequence, goalSequence) end

--- Fires an event with specified parameters.
--- @param origin Vector The origin of the event.
--- @param angles QAngle The angles of the event.
--- @param event integer The event ID.
--- @param options string The event options.
function CBaseAnimating:FireEvent(origin, angles, event, options) end

--- Fires an obsolete event with specified parameters.
--- @param origin Vector The origin of the event.
--- @param angles QAngle The angles of the event.
--- @param event integer The event ID.
--- @param options string The event options.
function CBaseAnimating:FireObsoleteEvent(origin, angles, event, options) end

--- Forces client-side animation to be enabled.
function CBaseAnimating:ForceClientSideAnimationOn() end

--- Advances the animation frame.
--- @param frameTime? number The time to advance (default: 0.0).
--- @return number frameTime The actual time advanced.
function CBaseAnimating:FrameAdvance(frameTime) end

--- Gets the aim entity's origin and angles.
--- @param aimEntity CBaseEntity The entity to aim at.
--- @param origin Vector The output origin.
--- @param angles QAngle The output angles.
function CBaseAnimating:GetAimEntOrigin(aimEntity, origin, angles) end

--- Gets the time interval for animations.
--- @return number interval The animation time interval.
function CBaseAnimating:GetAnimTimeInterval() end

--- Gets the position (and optionally angles) of an attachment by index or name.
--- @param attachment string|integer The attachment name or index.
--- @param origin Vector The output position.
--- @param angles? QAngle The output angles (optional).
--- @return boolean success Whether the attachment was found.
function CBaseAnimating:GetAttachment(attachment, origin, angles) end

--- Gets the local position and angles of an attachment by index.
--- @param attachmentIndex integer The attachment index.
--- @param origin Vector The output local position.
--- @param angles QAngle The output local angles.
--- @return boolean success Whether the attachment was found.
function CBaseAnimating:GetAttachmentLocal(attachmentIndex, origin, angles) end

--- Gets the velocity of an attachment.
--- @param attachmentIndex integer The attachment index.
--- @param originVel Vector The output origin velocity.
--- @return boolean success Whether the velocity was retrieved.
function CBaseAnimating:GetAttachmentVelocity(attachmentIndex, originVel) end

--- Gets the base animating entity.
--- @return CBaseAnimating entity The base animating entity.
function CBaseAnimating:GetBaseAnimating() end

--- Gets the blended linear velocity of the entity.
--- @return Vector velocity The blended linear velocity.
function CBaseAnimating:GetBlendedLinearVelocity() end

--- Gets the body index of the entity.
--- @return integer body The body index.
function CBaseAnimating:GetBody() end

--- Gets the bodygroup value for a specific group.
--- @param group integer The bodygroup index.
--- @return integer value The bodygroup value.
function CBaseAnimating:GetBodygroup(group) end

--- Gets the number of sub-bodygroups in a bodygroup.
--- @param group integer The bodygroup index.
--- @return integer count The number of sub-bodygroups.
function CBaseAnimating:GetBodygroupCount(group) end

--- Gets the name of a bodygroup.
--- @param group integer The bodygroup index.
--- @return string name The name of the bodygroup.
function CBaseAnimating:GetBodygroupName(group) end

--- Gets the bone controllers' values.
--- @return number[] controllers An array of up to 4 bone controller values.
function CBaseAnimating:GetBoneControllers() end

--- Gets the position and angles of a bone.
--- @param boneIndex integer The bone index.
--- @param origin Vector The output position.
--- @param angles QAngle The output angles.
function CBaseAnimating:GetBonePosition(boneIndex, origin, angles) end

--- Gets the client-side fade value.
--- @return integer fade The fade value.
function CBaseAnimating:GetClientSideFade() end

--- Gets the collision type of the entity.
--- @return integer collideType The collision type.
function CBaseAnimating:GetCollideType() end

--- Gets the current animation cycle.
--- @return number cycle The current cycle value (0.0 to 1.0).
function CBaseAnimating:GetCycle() end

--- Gets the name of a flex controller.
--- @param controllerIndex integer The flex controller index.
--- @return string name The name of the flex controller.
function CBaseAnimating:GetFlexControllerName(controllerIndex) end

--- Gets the type of a flex controller.
--- @param controllerIndex integer The flex controller index.
--- @return string type The type of the flex controller.
function CBaseAnimating:GetFlexControllerType(controllerIndex) end

--- Gets the flex descriptor factors.
--- @param flexIndex integer The flex descriptor index.
--- @return string factors The flex descriptor factors.
function CBaseAnimating:GetFlexDescFacs(flexIndex) end

--- Gets the current hitbox set index.
--- @return integer hitboxSet The hitbox set index.
function CBaseAnimating:GetHitboxSet() end

--- Gets the number of hitbox sets.
--- @return integer count The number of hitbox sets.
function CBaseAnimating:GetHitboxSetCount() end

--- Gets the name of the current hitbox set.
--- @return string name The name of the hitbox set.
function CBaseAnimating:GetHitboxSetName() end

--- Gets the number of bodygroups.
--- @return integer count The number of bodygroups.
function CBaseAnimating:GetNumBodyGroups() end

--- Gets the number of flex controllers.
--- @return integer count The number of flex controllers.
function CBaseAnimating:GetNumFlexControllers() end

--- Gets the current playback rate.
--- @return number rate The playback rate.
function CBaseAnimating:GetPlaybackRate() end

--- Gets the value of a pose parameter by index.
--- @param paramIndex integer The pose parameter index.
--- @return number value The pose parameter value.
function CBaseAnimating:GetPoseParameter(paramIndex) end

--- Gets the range of a pose parameter.
--- @param paramIndex integer The pose parameter index.
--- @return boolean success Whether the range was retrieved.
--- @return number minValue The minimum value of the pose parameter.
--- @return number maxValue The maximum value of the pose parameter.
function CBaseAnimating:GetPoseParameterRange(paramIndex) end

--- Gets the render angles of the entity.
--- @return QAngle angles The render angles.
function CBaseAnimating:GetRenderAngles() end

--- Gets the render bounds of the entity.
--- @return Vector mins The minimum bounds.
--- @return Vector maxs The maximum bounds.
function CBaseAnimating:GetRenderBounds() end

--- Gets the render origin of the entity.
--- @return Vector origin The render origin.
function CBaseAnimating:GetRenderOrigin() end

--- Gets the current sequence index.
--- @return integer sequence The sequence index.
function CBaseAnimating:GetSequence() end

--- Gets the activity of a sequence.
--- @param sequence integer The sequence index.
--- @return integer activity The activity ID.
function CBaseAnimating:GetSequenceActivity(sequence) end

--- Gets the name of the activity for a sequence.
--- @param sequence integer The sequence index.
--- @return string name The activity name.
function CBaseAnimating:GetSequenceActivityName(sequence) end

--- Gets the ground speed of a sequence.
--- @param sequence integer The sequence index.
--- @return number speed The ground speed.
function CBaseAnimating:GetSequenceGroundSpeed(sequence) end

--- Gets the linear motion of a sequence.
--- @param sequence integer The sequence index.
--- @return Vector motion The linear motion vector.
function CBaseAnimating:GetSequenceLinearMotion(sequence) end

--- Gets the name of a sequence.
--- @param sequence integer The sequence index.
--- @return string name The sequence name.
function CBaseAnimating:GetSequenceName(sequence) end

--- Gets the server-intended animation cycle.
--- @return number cycle The server-intended cycle value.
function CBaseAnimating:GetServerIntendedCycle() end

--- Gets the current skin index.
--- @return integer skin The skin index.
function CBaseAnimating:GetSkin() end

--- Ignites a ragdoll entity.
--- @param ragdoll CBaseAnimating The ragdoll entity to ignite.
function CBaseAnimating:IgniteRagdoll(ragdoll) end

--- Initializes the bone setup thread pool (static method).
function CBaseAnimating:InitBoneSetupThreadPool() end

--- Initializes model effects for the entity.
function CBaseAnimating:InitModelEffects() end

--- Draws the entity's model internally with specified flags.
--- @param flags integer The draw flags.
--- @return integer result The result of the draw operation.
function CBaseAnimating:InternalDrawModel(flags) end

--- Interpolates the entity for the given time.
--- @param currentTime number The current time for interpolation.
--- @return boolean success Whether interpolation was successful.
function CBaseAnimating:Interpolate(currentTime) end

--- Invalidates the bone cache for the entity.
function CBaseAnimating:InvalidateBoneCache() end

--- Invalidates the bone caches for all entities (static method).
function CBaseAnimating:InvalidateBoneCaches() end

--- Invalidates the model cache for the entity.
function CBaseAnimating:InvalidateMdlCache() end

--- Checks if the current activity is finished.
--- @return boolean finished Whether the activity is finished.
function CBaseAnimating:IsActivityFinished() end

--- Checks if the bone cache is valid.
--- @return boolean valid Whether the bone cache is valid.
function CBaseAnimating:IsBoneCacheValid() end

--- Checks if the entity is on fire.
--- @return boolean onFire Whether the entity is on fire.
function CBaseAnimating:IsOnFire() end

--- Checks if the entity is a ragdoll.
--- @return boolean isRagdoll Whether the entity is a ragdoll.
function CBaseAnimating:IsRagdoll() end

--- Checks if the entity is self-animating.
--- @return boolean selfAnimating Whether the entity is self-animating.
function CBaseAnimating:IsSelfAnimating() end

--- Checks if the current sequence is finished.
--- @return boolean finished Whether the sequence is finished.
function CBaseAnimating:IsSequenceFinished() end

--- Checks if a sequence is looping.
--- @param sequence integer The sequence index.
--- @return boolean looping Whether the sequence is looping.
function CBaseAnimating:IsSequenceLooping(sequence) end

--- Checks if the entity is a view model.
--- @return boolean isViewModel Whether the entity is a view model.
function CBaseAnimating:IsViewModel() end

--- Looks up an activity by name.
--- @param name string The activity name.
--- @return integer activityId The activity ID, or -1 if not found.
function CBaseAnimating:LookupActivity(name) end

--- Looks up an attachment by name.
--- @param name string The attachment name.
--- @return integer attachmentId The attachment ID, or -1 if not found.
function CBaseAnimating:LookupAttachment(name) end

--- Looks up a bone by name.
--- @param name string The bone name.
--- @return integer boneId The bone ID, or -1 if not found.
function CBaseAnimating:LookupBone(name) end

--- Looks up a pose parameter by name.
--- @param name string The pose parameter name.
--- @return integer paramId The pose parameter ID, or -1 if not found.
function CBaseAnimating:LookupPoseParameter(name) end

--- Looks up a random attachment by name.
--- @param name string The attachment name.
--- @return integer attachmentId The random attachment ID, or -1 if not found.
function CBaseAnimating:LookupRandomAttachment(name) end

--- Looks up a sequence by name.
--- @param name string The sequence name.
--- @return integer sequenceId The sequence ID, or -1 if not found.
function CBaseAnimating:LookupSequence(name) end

--- Notifies the entity of its transmission state.
--- @param state integer The transmission state (ShouldTransmitState_t).
function CBaseAnimating:NotifyShouldTransmit(state) end

--- Handles data changes for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:OnDataChanged(updateType) end

--- Prepares the entity for data changes.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:OnPreDataChanged(updateType) end

--- Pops bone access permissions (static method).
--- @param context string The context for bone access.
function CBaseAnimating:PopBoneAccess(context) end

--- Post-processes data updates for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:PostDataUpdate(updateType) end

--- Pre-processes data updates for the entity.
--- @param updateType integer The data update type (DataUpdateType_t).
function CBaseAnimating:PreDataUpdate(updateType) end

--- Processes a muzzle flash event.
function CBaseAnimating:ProcessMuzzleFlashEvent() end

--- Pushes bone access permissions (static method).
--- @param allow boolean Whether to allow bone access.
--- @param strict boolean Whether access is strict.
--- @param context string The context for bone access.
function CBaseAnimating:PushAllowBoneAccess(allow, strict, context) end

--- Notifies that the ragdoll has moved.
function CBaseAnimating:RagdollMoved() end

--- Releases the entity.
function CBaseAnimating:Release() end

--- Removes the entity from the client-side animation list.
function CBaseAnimating:RemoveFromClientSideAnimationList() end

--- Resets latched animation data.
function CBaseAnimating:ResetLatched() end

--- Resets the sequence to a specific index.
--- @param sequence integer The sequence index.
function CBaseAnimating:ResetSequence(sequence) end

--- Resets sequence information.
function CBaseAnimating:ResetSequenceInfo() end

--- Retrieves ragdoll information.
--- @return boolean success Whether the information was retrieved.
--- @return Vector position The ragdoll position.
function CBaseAnimating:RetrieveRagdollInfo() end

--- Selects a weighted sequence for an activity.
--- @param activity integer The activity ID (Activity).
--- @return integer sequenceId The selected sequence ID.
function CBaseAnimating:SelectWeightedSequence(activity) end

--- Gets the duration of a sequence or the current sequence.
--- @param sequence? integer The sequence index (optional).
--- @return number duration The sequence duration.
function CBaseAnimating:SequenceDuration(sequence) end

--- Checks if the current sequence loops.
--- @return boolean looping Whether the sequence loops.
function CBaseAnimating:SequenceLoops() end

--- Sets the bodygroup value for a specific group.
--- @param group integer The bodygroup index.
--- @param value integer The bodygroup value.
function CBaseAnimating:SetBodygroup(group, value) end

--- Sets a bone controller value.
--- @param controllerIndex integer The bone controller index.
--- @param value number The controller value.
--- @return number result The set value.
function CBaseAnimating:SetBoneController(controllerIndex, value) end

--- Sets the animation cycle.
--- @param cycle number The cycle value (0.0 to 1.0).
function CBaseAnimating:SetCycle(cycle) end

--- Sets the hitbox set by index.
--- @param setIndex integer The hitbox set index.
function CBaseAnimating:SetHitboxSet(setIndex) end

--- Sets the hitbox set by name.
--- @param setName string The hitbox set name.
function CBaseAnimating:SetHitboxSetByName(setName) end

--- Sets the playback rate.
--- @param rate number The playback rate.
function CBaseAnimating:SetPlaybackRate(rate) end

--- Sets a pose parameter by index or name.
--- @param param string|integer The pose parameter name or index.
--- @param value number The pose parameter value.
--- @return number value The set value.
function CBaseAnimating:SetPoseParameter(param, value) end

--- Sets whether the entity is predictable.
--- @param predictable boolean Whether the entity is predictable.
function CBaseAnimating:SetPredictable(predictable) end

--- Sets whether the entity is eligible for prediction.
--- @param eligible boolean Whether the entity is prediction-eligible.
function CBaseAnimating:SetPredictionEligible(eligible) end

--- Sets the prediction player.
--- @param player CBasePlayer The player for prediction.
function CBaseAnimating:SetPredictionPlayer(player) end

--- Sets the received sequence.
function CBaseAnimating:SetReceivedSequence() end

--- Sets the current sequence.
--- @param sequence integer The sequence index.
function CBaseAnimating:SetSequence(sequence) end

--- Sets the server-intended animation cycle.
--- @param cycle number The cycle value.
function CBaseAnimating:SetServerIntendedCycle(cycle) end

--- Gets the shadow cast type.
--- @return integer shadowType The shadow cast type.
function CBaseAnimating:ShadowCastType() end

--- Checks if the entity should display a muzzle flash.
--- @return boolean shouldFlash Whether a muzzle flash should be displayed.
function CBaseAnimating:ShouldMuzzleFlash() end

--- Checks if the sequence should reset on a new model.
--- @return boolean shouldReset Whether the sequence should reset.
function CBaseAnimating:ShouldResetSequenceOnNewModel() end

--- Shuts down the bone setup thread pool (static method).
function CBaseAnimating:ShutdownBoneSetupThreadPool() end

--- Simulates the entity.
function CBaseAnimating:Simulate() end

--- Advances the animation frame in studio mode.
function CBaseAnimating:StudioFrameAdvance() end

--- Performs threaded bone setup (static method).
function CBaseAnimating:ThreadedBoneSetup() end

--- Transfers dissolve effect from another entity.
--- @param other CBaseAnimating The source entity.
function CBaseAnimating:TransferDissolveFrom(other) end

--- Uncorrects a view model attachment.
--- @param attachment Vector The attachment to uncorrect.
function CBaseAnimating:UncorrectViewModelAttachment(attachment) end

--- Updates client-side animation.
function CBaseAnimating:UpdateClientSideAnimation() end

--- Updates client-side animations for all entities (static method).
function CBaseAnimating:UpdateClientSideAnimations() end

--- Updates IK locks for the entity.
--- @param currentTime number The current time for IK updates.
function CBaseAnimating:UpdateIKLocks(currentTime) end

--- Enables client-side animation.
function CBaseAnimating:UseClientSideAnimation() end

--- Checks if the entity uses a power-of-two framebuffer texture.
--- @return boolean usesPowerOfTwo Whether a power-of-two texture is used.
function CBaseAnimating:UsesPowerOfTwoFrameBufferTexture() end

--- Gets the list of physics objects associated with the entity.
--- @return integer count The number of physics objects.
--- @return table objects A table of IPhysicsObject instances.
function CBaseAnimating:VPhysicsGetObjectList() end

--- Updates the physics state with a physics object.
--- @param physicsObject IPhysicsObject The physics object to update with.
function CBaseAnimating:VPhysicsUpdate(physicsObject) end

--- Dissolves the entity using a normal dissolve effect.
function CBaseAnimating:Dissolve() end

--- Custom index metamethod for accessing fields and methods.
--- Supports fields: m_bClientSideAnimation, m_bLastClientSideFrameReset, m_nBody, m_nHitboxSet, m_nSkin.
--- Falls back to CBaseEntity metatable if field not found.
--- @param key string The field or method name.
--- @return any value The value or method associated with the key.
function CBaseAnimating:__index(key) end

--- Custom newindex metamethod for setting fields.
--- Supports fields: m_bClientSideAnimation (boolean), m_bLastClientSideFrameReset (boolean), m_nBody (integer), m_nHitboxSet (integer), m_nSkin (integer).
--- Other fields are stored in a custom Lua table.
--- @param key string The field name.
--- @param value any The value to set.
function CBaseAnimating:__newindex(key, value) end

--- Checks if two CBaseAnimating entities are equal.
--- @param other CBaseAnimating The other entity to compare.
--- @return boolean equal Whether the entities are equal.
function CBaseAnimating:__eq(other) end

--- Returns a string representation of the entity.
--- @return string str Format: "CBaseAnimating: <entindex> \"<classname>\"" or "NULL" if invalid.
function CBaseAnimating:__tostring() end

--- Entity scripting interface for CBaseScripted and CBaseScriptedTrigger entities.
--- @class ENT : CBaseAnimating
ENT = {}

---@class effect
---Library for creating game effects like explosions and dissolves.
effect = {}

---Dissolves an entity with a specific effect.
---@param entity any The entity to dissolve.
---@param effectName string The name of the dissolve effect.
---@param life float Duration of the dissolve in seconds.
---@param flags integer Flags controlling dissolve behavior.
---@return any The created dissolve entity.
function effect.Dissolve(entity, effectName, life, flags) end

---Creates an explosion at a given position.
---@param position table Vector `{x, y, z}` for the explosion location.
---@param angle table Angle `{pitch, yaw, roll}` for explosion orientation.
---@param owner any Entity that caused the explosion.
---@param magnitude integer Explosion magnitude.
---@param radius integer Explosion radius.
---@param doDamage boolean Whether the explosion deals damage.
---@param ignoreLOS? boolean Optional. If true, ignores line-of-sight checks. Default: false
---@param customEffect? boolean Optional. If true, uses a custom visual effect. Default: false
---@param soundType? integer Optional. Type of explosion sound. Default: -1
function effect.ExplosionCreate(position, angle, owner, magnitude, radius, doDamage, ignoreLOS, customEffect, soundType) end

---@class IN
---Input actions, corresponding to engine key/button flags.
IN = {}

---Primary attack (e.g., left mouse button)
IN.ATTACK = 0

---Jump action
IN.JUMP = 0

---Duck / crouch action
IN.DUCK = 0

---Move forward
IN.FORWARD = 0

---Move backward
IN.BACK = 0

---Use / interact with objects
IN.USE = 0

---Cancel current action
IN.CANCEL = 0

---Move left
IN.LEFT = 0

---Move right
IN.RIGHT = 0

---Strafe left
IN.MOVELEFT = 0

---Strafe right
IN.MOVERIGHT = 0

---Secondary attack (e.g., right mouse button)
IN.ATTACK2 = 0

---Run / sprint
IN.RUN = 0

---Reload weapon
IN.RELOAD = 0

---Alternative action 1
IN.ALT1 = 0

---Alternative action 2
IN.ALT2 = 0

---Show scoreboard
IN.SCORE = 0

---Enable speed modifier
IN.SPEED = 0

---Walk slowly
IN.WALK = 0

---Zoom / aim down sights
IN.ZOOM = 0

---Select weapon slot 1
IN.WEAPON1 = 0

---Select weapon slot 2
IN.WEAPON2 = 0

---Bullrush action
IN.BULLRUSH = 0

---Primary grenade
IN.GRENADE1 = 0

---Secondary grenade
IN.GRENADE2 = 0

---@class IPredictionSystem
---Library to control client/server prediction events.
IPredictionSystem = {}

---Suppresses all prediction events.
---@param suppress boolean Whether to suppress events.
function IPredictionSystem.SuppressEvents(suppress) end

---Suppresses host-specific prediction events for a given entity.
---@param entity any The entity whose host events to suppress.
function IPredictionSystem.SuppressHostEvents(entity) end

---@class FileHandle
---Represents an open file handle in the filesystem.
FileHandle = {}
FileHandle.__type = "filehandle"
FileHandle.FILESYSTEM_INVALID_HANDLE = nil -- global placeholder

---@class filesystem
---Library for managing files, search paths, and resources.
filesystem = {}

--[[
    Adds a .pak or zip pack file to the search paths.
    @param filename string Path to the pack file
    @param pathID string Path identifier (optional)
    @return boolean success
]]
function filesystem.AddPackFile(filename, pathID) end

--[[
    Adds a directory to the search path.
    @param path string Directory path
    @param pathID string Path identifier
    @param addToTail? integer Optional; defaults to PATH_ADD_TO_TAIL
]]
function filesystem.AddSearchPath(path, pathID, addToTail) end

---Begins access to map files.
function filesystem.BeginMapAccess() end

---Ends access to map files.
function filesystem.EndMapAccess() end

---Cancels waiting for resources.
---@param timeout integer Timeout in milliseconds
function filesystem.CancelWaitForResources(timeout) end

---Closes an open file handle.
---@param file FileHandle The file to close
function filesystem.Close(file) end

---Creates a directory hierarchy.
---@param path string Base path
---@param pathID? string Optional path identifier
function filesystem.CreateDirHierarchy(path, pathID) end

---Discards preloaded data.
function filesystem.DiscardPreloadData() end

---Disconnects from the filesystem.
function filesystem.Disconnect() end

---Enables or disables whitelist file tracking.
---@param enable boolean
---@param report boolean
---@param strict boolean
function filesystem.EnableWhitelistFileTracking(enable, report, strict) end

---Checks if a file exists.
---@param filename string File path
---@param pathID? string Optional path identifier
---@return boolean
function filesystem.FileExists(filename, pathID) end

---Flushes file buffers for a file handle.
---@param file FileHandle
function filesystem.Flush(file) end

---Gets the DVD mode of the filesystem.
---@return integer
function filesystem.GetDVDMode() end

---Retrieves a local copy of a file.
---@param filename string File path
function filesystem.GetLocalCopy(filename) end

---Gets whitelist debug flags.
---@return integer
function filesystem.GetWhitelistSpewFlags() end

---Hints that a resource is needed.
---@param resource string Resource path
---@param flags integer Flags controlling the resource hint
---@return integer result
function filesystem.HintResourceNeed(resource, flags) end

---Checks if a path is a directory.
---@param path string
---@param pathID? string Optional path identifier
---@return boolean
function filesystem.IsDirectory(path, pathID) end

---Checks if a file is immediately available.
---@param filename string
---@return boolean
function filesystem.IsFileImmediatelyAvailable(filename) end

---Checks if a file is writable.
---@param filename string
---@param pathID? string Optional
---@return boolean
function filesystem.IsFileWritable(filename, pathID) end

---Checks if a file handle is valid.
---@param file FileHandle
---@return boolean
function filesystem.IsOk(file) end

---Checks if the filesystem is using Steam content.
---@return boolean
function filesystem.IsSteam() end

---Loads precompiled KeyValues data.
---@param preloadType integer Preload type
---@param filename string Path to KeyValues file
function filesystem.LoadCompiledKeyValues(preloadType, filename) end

---Marks all CRCs as unverified.
function filesystem.MarkAllCRCsUnverified() end

---Marks a pathID as request-only.
---@param pathID string
---@param requestOnly boolean
function filesystem.MarkPathIDByRequestOnly(pathID, requestOnly) end

---Mounts Steam content.
---@param appID? integer Optional Steam app ID
---@return integer mountResult
function filesystem.MountSteamContent(appID) end

---Opens a file for reading/writing.
---@param filename string
---@param mode string File mode
---@param pathID? string Optional
---@return FileHandle
function filesystem.Open(filename, mode, pathID) end

---Precaches a file.
---@param filename string
---@param pathID? string Optional
---@return boolean
function filesystem.Precache(filename, pathID) end

---Prints a list of opened files to the console.
function filesystem.PrintOpenedFiles() end

---Prints the search paths to the console.
function filesystem.PrintSearchPaths() end

---Reads bytes from a file.
---@param size integer Number of bytes to read
---@param file FileHandle File to read from
---@return integer bytesRead
---@return string data
function filesystem.Read(size, file) end

---Removes all search paths.
function filesystem.RemoveAllSearchPaths() end

---Removes a specific file.
---@param filename string
---@param pathID? string Optional
function filesystem.RemoveFile(filename, pathID) end

---Removes a search path.
---@param path string
---@param pathID? string Optional
---@return boolean
function filesystem.RemoveSearchPath(path, pathID) end

---Removes all search paths matching a pathID.
---@param pathID string
function filesystem.RemoveSearchPaths(pathID) end

---Renames a file.
---@param oldName string
---@param newName string
---@param pathID? string Optional
---@return boolean
function filesystem.RenameFile(oldName, newName, pathID) end

---Sets a file as writable or read-only.
---@param filename string
---@param writable boolean
---@param pathID? string Optional
---@return boolean
function filesystem.SetFileWritable(filename, writable, pathID) end

---Prepares preload data for the filesystem.
function filesystem.SetupPreloadData() end

---Sets the warning level for filesystem operations.
---@param level integer Warning level
function filesystem.SetWarningLevel(level) end

---Sets whitelist debug flags.
---@param flags integer
function filesystem.SetWhitelistSpewFlags(flags) end

---Shuts down the filesystem.
function filesystem.Shutdown() end

---Gets the size of a file or handle.
---@param fileOrPath FileHandle|string File handle or file path
---@param pathID? string Optional
---@return integer
function filesystem.Size(fileOrPath, pathID) end

---Unzips a file to a directory.
---@param zipFile string Path to the zip file
---@param destDir string Destination directory
---@param pathID string Path identifier
---@return boolean
function filesystem.UnzipFile(zipFile, destDir, pathID) end

---Waits for required resources to be available.
---@param pathID string Path identifier
---@return integer
function filesystem.WaitForResources(pathID) end

---Writes a string to a file.
---@param data string Data to write
---@param file FileHandle File handle
---@return integer bytesWritten
function filesystem.Write(data, file) end

---@class FCVAR
FCVAR = {}

FCVAR.NONE = 0
FCVAR.UNREGISTERED = 1
FCVAR.DEVELOPMENTONLY = 2
FCVAR.GAMEDLL = 4
FCVAR.CLIENTDLL = 8
FCVAR.HIDDEN = 16
FCVAR.PROTECTED = 32
FCVAR.SPONLY = 64
FCVAR.ARCHIVE = 128
FCVAR.NOTIFY = 256
FCVAR.USERINFO = 512
FCVAR.CHEAT = 1024
FCVAR.PRINTABLEONLY = 2048
FCVAR.UNLOGGED = 4096
FCVAR.NEVER_AS_STRING = 8192
FCVAR.REPLICATED = 16384
FCVAR.DEMO = 32768
FCVAR.DONTRECORD = 65536
FCVAR.NOT_CONNECTED = 131072
FCVAR.ARCHIVE_XBOX = 262144
FCVAR.SERVER_CAN_EXECUTE = 524288
FCVAR.SERVER_CANNOT_QUERY = 1048576
FCVAR.CLIENTCMD_CAN_EXECUTE = 2097152

---@class ConCommand
ConCommand = {}

function ConCommand:CanAutoComplete() end
function ConCommand:IsCommand() end
function ConCommand:GetName() end

---@class ConVar
ConVar = {}

function ConVar:AddFlags(flags) end
function ConVar:GetBool() end
function ConVar:GetDefault() end
function ConVar:GetFloat() end
function ConVar:GetHelpText() end
function ConVar:GetInt() end
function ConVar:GetMax() end
function ConVar:GetMin() end
function ConVar:GetName() end
function ConVar:GetString() end
function ConVar:IsCommand() end
function ConVar:IsFlagSet(flag) end
function ConVar:IsRegistered() end
function ConVar:Revert() end
function ConVar:SetValue(value) end

---@class KeyValues
KeyValues = {}

function KeyValues:AddSubKey(kv) end
function KeyValues:ChainKeyValue(kv) end
function KeyValues:Clear() end
function KeyValues:CopySubkeys(kv) end
function KeyValues:CreateNewKey() end
function KeyValues:deleteThis() end
function KeyValues:FindKey(key, create) end
function KeyValues:GetColor(key) end
function KeyValues:GetDataType(key) end
function KeyValues:GetFirstSubKey() end
function KeyValues:GetFirstTrueSubKey() end
function KeyValues:GetFirstValue() end
function KeyValues:GetFloat(key, default) end
function KeyValues:GetInt(key, default) end
function KeyValues:GetName() end
function KeyValues:GetNameSymbol() end
function KeyValues:GetNextKey() end
function KeyValues:GetNextTrueSubKey() end
function KeyValues:GetNextValue() end
function KeyValues:GetString(key, default) end
function KeyValues:IsEmpty(key) end
function KeyValues:LoadFromFile(fs, filename, pathID) end
function KeyValues:MakeCopy() end
function KeyValues:ProcessResolutionKeys(resolution) end
function KeyValues:RemoveSubKey(kv) end
function KeyValues:SaveToFile(fs, filename, pathID) end
function KeyValues:SetColor(key, color) end
function KeyValues:SetFloat(key, value) end
function KeyValues:SetInt(key, value) end
function KeyValues:SetName(name) end
function KeyValues:SetNextKey(kv) end
function KeyValues:SetString(key, value) end
function KeyValues:SetStringValue(value) end
function KeyValues:UsesEscapeSequences(use) end

--- Represents the result of a trace (line/hull) in the game world.
---@class CGameTrace
--- All solid flag, true if the trace started in a solid area.
---@field allsolid boolean
--- Bitmask of contents the trace passed through.
---@field contents integer
--- Displacement surface flags.
---@field dispFlags integer
--- End position of the trace.
---@field endpos Vector
--- Fraction of the trace completed before hitting something (0..1).
---@field fraction number
--- Fraction of the trace left in solid (for starting inside solid).
---@field fractionleftsolid number
--- Hitbox index of the entity hit.
---@field hitbox integer
--- Hitgroup of the entity hit.
---@field hitgroup integer
--- Entity hit by the trace.
---@field m_pEnt CBaseEntity
--- Physics bone index hit (if any).
---@field physicsbone integer
--- Start position of the trace.
---@field startpos Vector
--- True if the trace started inside solid.
---@field startsolid boolean
--- Surface info of the hit.
---@field surface CSurface
CGameTrace = {}

--- Checks if the trace hit anything.
---@return boolean
function CGameTrace:DidHit() end

--- Checks if the trace hit a non-world entity (player, prop, etc.).
---@return boolean
function CGameTrace:DidHitNonWorldEntity() end

--- Checks if the trace hit the world geometry.
---@return boolean
function CGameTrace:DidHitWorld() end

--- Returns the entity index of the hit entity (0 if none).
---@return integer
function CGameTrace:GetEntityIndex() end

--- Returns true if the trace hit a displacement surface.
---@return boolean
function CGameTrace:IsDispSurface() end

--- Returns true if the displacement surface is buildable.
---@return boolean
function CGameTrace:IsDispSurfaceBuildable() end

--- Returns true if the displacement surface has Prop1 flag.
---@return boolean
function CGameTrace:IsDispSurfaceProp1() end

--- Returns true if the displacement surface has Prop2 flag.
---@return boolean
function CGameTrace:IsDispSurfaceProp2() end

--- Returns true if the displacement surface is walkable.
---@return boolean
function CGameTrace:IsDispSurfaceWalkable() end

--- Creates a new empty trace_t.
---@return CGameTrace
function trace_t() end

-- Integer bounds
MAX_COORD_INTEGER = 16384
MIN_COORD_INTEGER = -MAX_COORD_INTEGER

-- Fractional bounds (15/16)
MAX_COORD_FRACTION = 1.0 - (1.0/16.0)
MIN_COORD_FRACTION = -1.0 + (1.0/16.0)

-- Float bounds
MAX_COORD_FLOAT = 16384.0
MIN_COORD_FLOAT = -16384.0

-- Width of the coordinate system
COORD_EXTENT = 2 * MAX_COORD_INTEGER

-- Maximum traceable distance (cube diagonal)
MAX_TRACE_LENGTH = 1.732050807569 * COORD_EXTENT

-- Longest possible range (same as MAX_COORD_INTEGER)
MAX_COORD_RANGE = MAX_COORD_INTEGER

---@class mathlib
mathlib = {}

---TODO: add desc
---@param x number
---@param y number
---@param z number
---@return number
function mathlib.clamp(x, y, z) end

---Returns the absolute value of x
---@param x number
---@return number
function mathlib.abs(x) end

---Returns the sine of x (x in radians)
---@param x number
---@return number
function mathlib.sin(x) end

---Returns the hyperbolic sine of x
---@param x number
---@return number
function mathlib.sinh(x) end

---Returns the cosine of x (x in radians)
---@param x number
---@return number
function mathlib.cos(x) end

---Returns the hyperbolic cosine of x
---@param x number
---@return number
function mathlib.cosh(x) end

---Returns the tangent of x (x in radians)
---@param x number
---@return number
function mathlib.tan(x) end

---Returns the hyperbolic tangent of x
---@param x number
---@return number
function mathlib.tanh(x) end

---Returns the arcsine of x (in radians)
---@param x number
---@return number
function mathlib.asin(x) end

---Returns the arccosine of x (in radians)
---@param x number
---@return number
function mathlib.acos(x) end

---Returns the arctangent of x (in radians)
---@param x number
---@return number
function mathlib.atan(x) end

---Returns the arctangent of y/x taking into account the quadrant
---@param y number
---@param x number
---@return number
function mathlib.atan2(y, x) end

---Returns the smallest integer greater than or equal to x
---@param x number
---@return number
function mathlib.ceil(x) end

---Returns the largest integer less than or equal to x
---@param x number
---@return number
function mathlib.floor(x) end

---Returns the remainder of x/y
---@param x number
---@param y number
---@return number
function mathlib.fmod(x, y) end

---Returns the integer and fractional parts of x
---@param x number
---@return number ip
---@return number fp
function mathlib.modf(x) end

---Returns the square root of x
---@param x number
---@return number
function mathlib.sqrt(x) end

---Returns x raised to the power y
---@param x number
---@param y number
---@return number
function mathlib.pow(x, y) end

---Returns the natural logarithm of x
---@param x number
---@return number
function mathlib.log(x) end

---Returns the base-10 logarithm of x
---@param x number
---@return number
function mathlib.log10(x) end

---Returns e raised to the power x
---@param x number
---@return number
function mathlib.exp(x) end

---Converts radians to degrees
---@param x number
---@return number
function mathlib.deg(x) end

---Converts degrees to radians
---@param x number
---@return number
function mathlib.rad(x) end

---Returns the normalized fraction and exponent of x
---@param x number
---@return number frac
---@return integer exp
function mathlib.frexp(x) end

---Returns x * 2^exp
---@param x number
---@param exp integer
---@return number
function mathlib.ldexp(x, exp) end

---Returns the minimum of all arguments
---@vararg number
---@return number
function mathlib.min(...) end

---Returns the maximum of all arguments
---@vararg number
---@return number
function mathlib.max(...) end

---Returns a random number between 0 and 1, or in a specified range
---@param l? integer
---@param u? integer
---@return number
function mathlib.random(l, u) end

---Sets the seed for random number generation
---@param seed integer
function mathlib.randomseed(seed) end

---@return number pi
mathlib.pi = 3.14159265358979323846

---@return number huge
mathlib.huge = math.huge

-- Registry of classes/metatables
_R = {}

-- Entity methods
_E = {}

--- Input library
--- @class input
input = {}

--- Returns whether candidate list indexing starts at 1
--- @return boolean
function input.CandidateListStartsAtOne()
    return false
end

--- Returns the panel that has app-modal input
--- @return userdata|nil
function input.GetAppModalSurface()
    return nil
end

--- Returns the number of candidate items
--- @return integer
function input.GetCandidateListCount()
    return 0
end

--- Returns the number of items per page in candidate list
--- @return integer
function input.GetCandidateListPageSize()
    return 0
end

--- Returns the first item index of the current page
--- @return integer
function input.GetCandidateListPageStart()
    return 0
end

--- Returns the currently selected item in candidate list
--- @return integer
function input.GetCandidateListSelectedItem()
    return 0
end

--- Returns the current IME handle
--- @return integer
function input.GetCurrentIMEHandle()
    return 0
end

--- Returns cursor position (x, y)
--- @return integer x
--- @return integer y
function input.GetCursorPosition()
    return 0, 0
end

--- Returns English IME handle
--- @return integer
function input.GetEnglishIMEHandle()
    return 0
end

--- Returns the panel that currently has focus
--- @return userdata|nil
function input.GetFocus()
    return nil
end

--- Returns the modal sub-tree panel
--- @return userdata|nil
function input.GetModalSubTree()
    return nil
end

--- Returns the panel that currently has mouse capture
--- @return userdata|nil
function input.GetMouseCapture()
    return nil
end

--- Returns the panel that the mouse is currently over
--- @return userdata|nil
function input.GetMouseOver()
    return nil
end

--- Returns whether composition string should be inverted
--- @return boolean
function input.GetShouldInvertCompositionString()
    return false
end

--- Returns whether a key is currently down
--- @param key integer
--- @return boolean
function input.IsKeyDown(key)
    return false
end

--- Returns whether a mouse button is currently down
--- @param button integer
--- @return boolean
function input.IsMouseDown(button)
    return false
end

--- Stub for OnChangeIME event
--- @param enable boolean
function input.OnChangeIME(enable)
end

--- Stub for OnKeyCodeUnhandled event
--- @param key integer
function input.OnKeyCodeUnhandled(key)
end

--- Sets cursor position
--- @param x integer
--- @param y integer
function input.SetCursorPos(x, y)
end

--- Checks whether the modal sub-tree should receive messages
--- @return boolean
function input.ShouldModalSubTreeReceiveMessages()
    return false
end

--- Returns whether a key was pressed
--- @param key integer
--- @return boolean
function input.WasKeyPressed(key)
    return false
end

--- Returns whether a key was released
--- @param key integer
--- @return boolean
function input.WasKeyReleased(key)
    return false
end

--- Returns whether a key was typed
--- @param key integer
--- @return boolean
function input.WasKeyTyped(key)
    return false
end

--- Returns whether a mouse button was pressed
--- @param button integer
--- @return boolean
function input.WasMousePressed(button)
    return false
end

--- Returns whether a mouse button was released
--- @param button integer
--- @return boolean
function input.WasMouseReleased(button)
    return false
end

-- global NULL value
NULL = nil

-- start activities

--- Invalid activity, used to check for invalid states.
ACT_INVALID = nil

--- Reset activity to force a reset to m_IdealActivity.
ACT_RESET = nil

--- Idle animation.
ACT_IDLE = nil

--- Transition between activities.
ACT_TRANSITION = nil

--- Cover animation (obsolete, redundant with ACT_COVER_LOW).
ACT_COVER = nil

--- Medium cover animation (unsupported).
ACT_COVER_MED = nil

--- Low cover animation (rename to ACT_IDLE_CROUCH?).
ACT_COVER_LOW = nil

--- Walking animation.
ACT_WALK = nil

--- Walking while aiming.
ACT_WALK_AIM = nil

--- Crouching walk animation.
ACT_WALK_CROUCH = nil

--- Crouching walk while aiming.
ACT_WALK_CROUCH_AIM = nil

--- Running animation.
ACT_RUN = nil

--- Running while aiming.
ACT_RUN_AIM = nil

--- Crouching run animation.
ACT_RUN_CROUCH = nil

--- Crouching run while aiming.
ACT_RUN_CROUCH_AIM = nil

--- Running while protected.
ACT_RUN_PROTECTED = nil

--- Custom movement defined by script.
ACT_SCRIPT_CUSTOM_MOVE = nil

--- Primary range attack.
ACT_RANGE_ATTACK1 = nil

--- Secondary range attack.
ACT_RANGE_ATTACK2 = nil

--- Crouched primary range attack (not used yet).
ACT_RANGE_ATTACK1_LOW = nil

--- Crouched secondary range attack (not used yet).
ACT_RANGE_ATTACK2_LOW = nil

--- Simple death animation.
ACT_DIESIMPLE = nil

--- Death animation, falling backward.
ACT_DIEBACKWARD = nil

--- Death animation, falling forward.
ACT_DIEFORWARD = nil

--- Violent death animation.
ACT_DIEVIOLENT = nil

--- Death with ragdoll physics.
ACT_DIERAGDOLL = nil

--- Flying animation (and flapping if appropriate).
ACT_FLY = nil

--- Hovering animation.
ACT_HOVER = nil

--- Gliding animation.
ACT_GLIDE = nil

--- Swimming animation.
ACT_SWIM = nil

--- Jumping animation.
ACT_JUMP = nil

--- Vertical jump (hop).
ACT_HOP = nil

--- Long forward jump (leap).
ACT_LEAP = nil

--- Landing animation.
ACT_LAND = nil

--- Climbing up animation.
ACT_CLIMB_UP = nil

--- Climbing down animation.
ACT_CLIMB_DOWN = nil

--- Dismounting from climbing.
ACT_CLIMB_DISMOUNT = nil

--- Climbing up a ship ladder.
ACT_SHIPLADDER_UP = nil

--- Climbing down a ship ladder.
ACT_SHIPLADDER_DOWN = nil

--- Strafing left.
ACT_STRAFE_LEFT = nil

--- Strafing right.
ACT_STRAFE_RIGHT = nil

--- Tuck and roll left.
ACT_ROLL_LEFT = nil

--- Tuck and roll right.
ACT_ROLL_RIGHT = nil

--- Quick turn left (stationary).
ACT_TURN_LEFT = nil

--- Quick turn right (stationary).
ACT_TURN_RIGHT = nil

--- Crouching down from standing (obsolete, used by soldier).
ACT_CROUCH = nil

--- Holding body in crouched position (obsolete, used by soldier).
ACT_CROUCHIDLE = nil

--- Standing up from crouching (obsolete, should be transition).
ACT_STAND = nil

--- Using an object or interactable.
ACT_USE = nil

--- First signal animation.
ACT_SIGNAL1 = nil

--- Second signal animation.
ACT_SIGNAL2 = nil

--- Third signal animation.
ACT_SIGNAL3 = nil

--- Squad signal to advance.
ACT_SIGNAL_ADVANCE = nil

--- Squad signal to move forward.
ACT_SIGNAL_FORWARD = nil

--- Squad signal to group.
ACT_SIGNAL_GROUP = nil

--- Squad signal to halt.
ACT_SIGNAL_HALT = nil

--- Squad signal to move left.
ACT_SIGNAL_LEFT = nil

--- Squad signal to move right.
ACT_SIGNAL_RIGHT = nil

--- Squad signal to take cover.
ACT_SIGNAL_TAKECOVER = nil

--- Look back over right shoulder without turning.
ACT_LOOKBACK_RIGHT = nil

--- Look back over left shoulder without turning.
ACT_LOOKBACK_LEFT = nil

--- Cowering animation (unused, more extreme crouching).
ACT_COWER = nil

--- Small flinch animation (needed? use overlays instead?).
ACT_SMALL_FLINCH = nil

--- Big flinch animation.
ACT_BIG_FLINCH = nil

--- Primary melee attack.
ACT_MELEE_ATTACK1 = nil

--- Secondary melee attack.
ACT_MELEE_ATTACK2 = nil

--- Reload animation.
ACT_RELOAD = nil

--- Start of reload animation.
ACT_RELOAD_START = nil

--- End of reload animation.
ACT_RELOAD_FINISH = nil

--- Low reload animation.
ACT_RELOAD_LOW = nil

--- Pulling out a weapon (e.g., gun).
ACT_ARM = nil

--- Reholstering a weapon.
ACT_DISARM = nil

--- Dropping a weapon.
ACT_DROP_WEAPON = nil

--- Dropping a shotgun.
ACT_DROP_WEAPON_SHOTGUN = nil

--- Picking up an object from the ground.
ACT_PICKUP_GROUND = nil

--- Picking up an object from a rack or shelf.
ACT_PICKUP_RACK = nil

--- Combat-ready idle animation (agitated).
ACT_IDLE_ANGRY = nil

--- Relaxed idle animation.
ACT_IDLE_RELAXED = nil

--- Stimulated idle animation.
ACT_IDLE_STIMULATED = nil

--- Agitated idle animation.
ACT_IDLE_AGITATED = nil

--- Stealth idle animation.
ACT_IDLE_STEALTH = nil

--- Hurt idle animation.
ACT_IDLE_HURT = nil

--- Relaxed walk animation.
ACT_WALK_RELAXED = nil

--- Stimulated walk animation.
ACT_WALK_STIMULATED = nil

--- Agitated walk animation.
ACT_WALK_AGITATED = nil

--- Stealth walk animation.
ACT_WALK_STEALTH = nil

--- Relaxed run animation.
ACT_RUN_RELAXED = nil

--- Stimulated run animation.
ACT_RUN_STIMULATED = nil

--- Agitated run animation.
ACT_RUN_AGITATED = nil

--- Stealth run animation.
ACT_RUN_STEALTH = nil

--- Relaxed aiming idle animation.
ACT_IDLE_AIM_RELAXED = nil

--- Stimulated aiming idle animation.
ACT_IDLE_AIM_STIMULATED = nil

--- Agitated aiming idle animation.
ACT_IDLE_AIM_AGITATED = nil

--- Stealth aiming idle animation.
ACT_IDLE_AIM_STEALTH = nil

--- Relaxed aiming walk animation.
ACT_WALK_AIM_RELAXED = nil

--- Stimulated aiming walk animation.
ACT_WALK_AIM_STIMULATED = nil

--- Agitated aiming walk animation.
ACT_WALK_AIM_AGITATED = nil

--- Stealth aiming walk animation.
ACT_WALK_AIM_STEALTH = nil

--- Relaxed aiming run animation.
ACT_RUN_AIM_RELAXED = nil

--- Stimulated aiming run animation.
ACT_RUN_AIM_STIMULATED = nil

--- Agitated aiming run animation.
ACT_RUN_AIM_AGITATED = nil

--- Stealth aiming run animation.
ACT_RUN_AIM_STEALTH = nil

--- Stimulated crouching idle animation.
ACT_CROUCHIDLE_STIMULATED = nil

--- Stimulated aiming crouching idle animation.
ACT_CROUCHIDLE_AIM_STIMULATED = nil

--- Agitated crouching idle animation.
ACT_CROUCHIDLE_AGITATED = nil

--- Hurt walk animation (limping).
ACT_WALK_HURT = nil

--- Hurt run animation (limping).
ACT_RUN_HURT = nil

--- Monster-specific special attack 1.
ACT_SPECIAL_ATTACK1 = nil

--- Monster-specific special attack 2.
ACT_SPECIAL_ATTACK2 = nil

--- Agitated combat idle (unused).
ACT_COMBAT_IDLE = nil

--- Scared walk animation.
ACT_WALK_SCARED = nil

--- Scared run animation.
ACT_RUN_SCARED = nil

--- Victory dance after killing a player.
ACT_VICTORY_DANCE = nil

--- Death from headshot.
ACT_DIE_HEADSHOT = nil

--- Death from chest shot.
ACT_DIE_CHESTSHOT = nil

--- Death from gut shot.
ACT_DIE_GUTSHOT = nil

--- Death from back shot.
ACT_DIE_BACKSHOT = nil

--- Flinch from head hit.
ACT_FLINCH_HEAD = nil

--- Flinch from chest hit.
ACT_FLINCH_CHEST = nil

--- Flinch from stomach hit.
ACT_FLINCH_STOMACH = nil

--- Flinch from left arm hit.
ACT_FLINCH_LEFTARM = nil

--- Flinch from right arm hit.
ACT_FLINCH_RIGHTARM = nil

--- Flinch from left leg hit.
ACT_FLINCH_LEFTLEG = nil

--- Flinch from right leg hit.
ACT_FLINCH_RIGHTLEG = nil

--- Flinch with physics interaction.
ACT_FLINCH_PHYSICS = nil

--- Idle animation while on fire.
ACT_IDLE_ON_FIRE = nil

--- Walk animation while on fire.
ACT_WALK_ON_FIRE = nil

--- Run animation while on fire.
ACT_RUN_ON_FIRE = nil

--- Rappel loop animation.
ACT_RAPPEL_LOOP = nil

--- 180-degree left turn.
ACT_180_LEFT = nil

--- 180-degree right turn.
ACT_180_RIGHT = nil

--- 90-degree left turn.
ACT_90_LEFT = nil

--- 90-degree right turn.
ACT_90_RIGHT = nil

--- Single step left.
ACT_STEP_LEFT = nil

--- Single step right.
ACT_STEP_RIGHT = nil

--- Single step backward.
ACT_STEP_BACK = nil

--- Single step forward.
ACT_STEP_FORE = nil

--- Primary range attack gesture.
ACT_GESTURE_RANGE_ATTACK1 = nil

--- Secondary range attack gesture.
ACT_GESTURE_RANGE_ATTACK2 = nil

--- Primary melee attack gesture.
ACT_GESTURE_MELEE_ATTACK1 = nil

--- Secondary melee attack gesture.
ACT_GESTURE_MELEE_ATTACK2 = nil

--- Crouched primary range attack gesture (not used yet).
ACT_GESTURE_RANGE_ATTACK1_LOW = nil

--- Crouched secondary range attack gesture (not used yet).
ACT_GESTURE_RANGE_ATTACK2_LOW = nil

--- Melee attack swing gesture.
ACT_MELEE_ATTACK_SWING_GESTURE = nil

--- Small flinch gesture.
ACT_GESTURE_SMALL_FLINCH = nil

--- Big flinch gesture.
ACT_GESTURE_BIG_FLINCH = nil

--- Flinch gesture from explosion.
ACT_GESTURE_FLINCH_BLAST = nil

--- Flinch gesture from shotgun blast.
ACT_GESTURE_FLINCH_BLAST_SHOTGUN = nil

--- Flinch gesture from explosion damage.
ACT_GESTURE_FLINCH_BLAST_DAMAGED = nil

--- Flinch gesture from shotgun explosion damage.
ACT_GESTURE_FLINCH_BLAST_DAMAGED_SHOTGUN = nil

--- Flinch gesture from head hit.
ACT_GESTURE_FLINCH_HEAD = nil

--- Flinch gesture from chest hit.
ACT_GESTURE_FLINCH_CHEST = nil

--- Flinch gesture from stomach hit.
ACT_GESTURE_FLINCH_STOMACH = nil

--- Flinch gesture from left arm hit.
ACT_GESTURE_FLINCH_LEFTARM = nil

--- Flinch gesture from right arm hit.
ACT_GESTURE_FLINCH_RIGHTARM = nil

--- Flinch gesture from left leg hit.
ACT_GESTURE_FLINCH_LEFTLEG = nil

--- Flinch gesture from right leg hit.
ACT_GESTURE_FLINCH_RIGHTLEG = nil

--- Turn left gesture.
ACT_GESTURE_TURN_LEFT = nil

--- Turn right gesture.
ACT_GESTURE_TURN_RIGHT = nil

--- 45-degree left turn gesture.
ACT_GESTURE_TURN_LEFT45 = nil

--- 45-degree right turn gesture.
ACT_GESTURE_TURN_RIGHT45 = nil

--- 90-degree left turn gesture.
ACT_GESTURE_TURN_LEFT90 = nil

--- 90-degree right turn gesture.
ACT_GESTURE_TURN_RIGHT90 = nil

--- Flat 45-degree left turn gesture.
ACT_GESTURE_TURN_LEFT45_FLAT = nil

--- Flat 45-degree right turn gesture.
ACT_GESTURE_TURN_RIGHT45_FLAT = nil

--- Flat 90-degree left turn gesture.
ACT_GESTURE_TURN_LEFT90_FLAT = nil

--- Flat 90-degree right turn gesture.
ACT_GESTURE_TURN_RIGHT90_FLAT = nil

--- Barnacle tongue hit.
ACT_BARNACLE_HIT = nil

--- Barnacle lifting monster (loop).
ACT_BARNACLE_PULL = nil

--- Barnacle latching onto monster.
ACT_BARNACLE_CHOMP = nil

--- Barnacle holding monster in mouth (loop).
ACT_BARNACLE_CHEW = nil

--- Do not disturb NPC sequence.
ACT_DO_NOT_DISTURB = nil

--- Draw weapon viewmodel animation.
ACT_VM_DRAW = nil

--- Holster weapon viewmodel animation.
ACT_VM_HOLSTER = nil

--- Idle weapon viewmodel animation.
ACT_VM_IDLE = nil

--- Fidget weapon viewmodel animation.
ACT_VM_FIDGET = nil

--- Pullback weapon viewmodel animation.
ACT_VM_PULLBACK = nil

--- High pullback weapon viewmodel animation.
ACT_VM_PULLBACK_HIGH = nil

--- Low pullback weapon viewmodel animation.
ACT_VM_PULLBACK_LOW = nil

--- Throw weapon viewmodel animation.
ACT_VM_THROW = nil

--- Pull pin for grenade viewmodel animation.
ACT_VM_PULLPIN = nil

--- Primary attack viewmodel animation.
ACT_VM_PRIMARYATTACK = nil

--- Secondary attack viewmodel animation.
ACT_VM_SECONDARYATTACK = nil

--- Reload viewmodel animation.
ACT_VM_RELOAD = nil

--- Reload start viewmodel animation.
ACT_VM_RELOAD_START = nil

--- Reload finish viewmodel animation.
ACT_VM_RELOAD_FINISH = nil

--- Dry fire viewmodel animation (no ammo).
ACT_VM_DRYFIRE = nil

--- Bludgeon swing left hit (primary attack).
ACT_VM_HITLEFT = nil

--- Bludgeon swing left hit (secondary attack).
ACT_VM_HITLEFT2 = nil

--- Bludgeon swing right hit (primary attack).
ACT_VM_HITRIGHT = nil

--- Bludgeon swing right hit (secondary attack).
ACT_VM_HITRIGHT2 = nil

--- Bludgeon swing center hit (primary attack).
ACT_VM_HITCENTER = nil

--- Bludgeon swing center hit (secondary attack).
ACT_VM_HITCENTER2 = nil

--- Bludgeon swing left miss (primary attack).
ACT_VM_MISSLEFT = nil

--- Bludgeon swing left miss (secondary attack).
ACT_VM_MISSLEFT2 = nil

--- Bludgeon swing right miss (primary attack).
ACT_VM_MISSRIGHT = nil

--- Bludgeon swing right miss (secondary attack).
ACT_VM_MISSRIGHT2 = nil

--- Bludgeon swing center miss (primary attack).
ACT_VM_MISSCENTER = nil

--- Bludgeon swing center miss (secondary attack).
ACT_VM_MISSCENTER2 = nil

--- Bludgeon haul back for hard strike (secondary attack).
ACT_VM_HAULBACK = nil

--- Bludgeon release hard strike (secondary attack).
ACT_VM_SWINGHARD = nil

--- Bludgeon swing miss.
ACT_VM_SWINGMISS = nil

--- Bludgeon swing hit.
ACT_VM_SWINGHIT = nil

--- Transition from idle to lowered viewmodel animation.
ACT_VM_IDLE_TO_LOWERED = nil

--- Lowered idle viewmodel animation.
ACT_VM_IDLE_LOWERED = nil

--- Transition from lowered to idle viewmodel animation.
ACT_VM_LOWERED_TO_IDLE = nil

--- Recoil animation 1.
ACT_VM_RECOIL1 = nil

--- Recoil animation 2.
ACT_VM_RECOIL2 = nil

--- Recoil animation 3.
ACT_VM_RECOIL3 = nil

--- Pickup weapon viewmodel animation.
ACT_VM_PICKUP = nil

--- Release weapon viewmodel animation.
ACT_VM_RELEASE = nil

--- Attach silencer viewmodel animation.
ACT_VM_ATTACH_SILENCER = nil

--- Detach silencer viewmodel animation.
ACT_VM_DETACH_SILENCER = nil

--- Special draw viewmodel animation (TF2 Scout Pack).
ACT_VM_DRAW_SPECIAL = nil

--- Special holster viewmodel animation (TF2 Scout Pack).
ACT_VM_HOLSTER_SPECIAL = nil

--- Special idle viewmodel animation (TF2 Scout Pack).
ACT_VM_IDLE_SPECIAL = nil

--- Special pullback viewmodel animation (TF2 Scout Pack).
ACT_VM_PULLBACK_SPECIAL = nil

--- Special primary attack viewmodel animation (TF2 Scout Pack).
ACT_VM_PRIMARYATTACK_SPECIAL = nil

--- Special secondary attack viewmodel animation (TF2 Scout Pack).
ACT_VM_SECONDARYATTACK_SPECIAL = nil

--- Special center hit viewmodel animation (TF2 Scout Pack).
ACT_VM_HITCENTER_SPECIAL = nil

--- Special hard swing viewmodel animation (TF2 Scout Pack).
ACT_VM_SWINGHARD_SPECIAL = nil

--- Special idle to lowered viewmodel animation (TF2 Scout Pack).
ACT_VM_IDLE_TO_LOWERED_SPECIAL = nil

--- Special lowered idle viewmodel animation (TF2 Scout Pack).
ACT_VM_IDLE_LOWERED_SPECIAL = nil

--- Special lowered to idle viewmodel animation (TF2 Scout Pack).
ACT_VM_LOWERED_TO_IDLE_SPECIAL = nil

--- Fists hit left viewmodel animation.
ACT_FISTS_VM_HITLEFT = nil

--- Fists hit right viewmodel animation.
ACT_FISTS_VM_HITRIGHT = nil

--- Fists swing hard viewmodel animation.
ACT_FISTS_VM_SWINGHARD = nil

--- Fists idle viewmodel animation.
ACT_FISTS_VM_IDLE = nil

--- Fists draw viewmodel animation.
ACT_FISTS_VM_DRAW = nil

--- SLAM stickwall idle animation.
ACT_SLAM_STICKWALL_IDLE = nil

--- SLAM stickwall no-draw idle animation.
ACT_SLAM_STICKWALL_ND_IDLE = nil

--- SLAM stickwall attach animation.
ACT_SLAM_STICKWALL_ATTACH = nil

--- SLAM stickwall attach 2 animation.
ACT_SLAM_STICKWALL_ATTACH2 = nil

--- SLAM stickwall no-draw attach animation.
ACT_SLAM_STICKWALL_ND_ATTACH = nil

--- SLAM stickwall no-draw attach 2 animation.
ACT_SLAM_STICKWALL_ND_ATTACH2 = nil

--- SLAM stickwall detonate animation.
ACT_SLAM_STICKWALL_DETONATE = nil

--- SLAM stickwall detonator holster animation.
ACT_SLAM_STICKWALL_DETONATOR_HOLSTER = nil

--- SLAM stickwall draw animation.
ACT_SLAM_STICKWALL_DRAW = nil

--- SLAM stickwall no-draw draw animation.
ACT_SLAM_STICKWALL_ND_DRAW = nil

--- SLAM stickwall to throw animation.
ACT_SLAM_STICKWALL_TO_THROW = nil

--- SLAM stickwall to throw no-draw animation.
ACT_SLAM_STICKWALL_TO_THROW_ND = nil

--- SLAM stickwall to tripmine no-draw animation.
ACT_SLAM_STICKWALL_TO_TRIPMINE_ND = nil

--- SLAM throw idle animation.
ACT_SLAM_THROW_IDLE = nil

--- SLAM throw no-draw idle animation.
ACT_SLAM_THROW_ND_IDLE = nil

--- SLAM throw animation.
ACT_SLAM_THROW_THROW = nil

--- SLAM throw 2 animation.
ACT_SLAM_THROW_THROW2 = nil

--- SLAM throw no-draw animation.
ACT_SLAM_THROW_THROW_ND = nil

--- SLAM throw no-draw 2 animation.
ACT_SLAM_THROW_THROW_ND2 = nil

--- SLAM throw draw animation.
ACT_SLAM_THROW_DRAW = nil

--- SLAM throw no-draw draw animation.
ACT_SLAM_THROW_ND_DRAW = nil

--- SLAM throw to stickwall animation.
ACT_SLAM_THROW_TO_STICKWALL = nil

--- SLAM throw to stickwall no-draw animation.
ACT_SLAM_THROW_TO_STICKWALL_ND = nil

--- SLAM throw to tripmine no-draw animation.
ACT_SLAM_THROW_TO_TRIPMINE_ND = nil

--- SLAM tripmine idle animation.
ACT_SLAM_TRIPMINE_IDLE = nil

--- SLAM tripmine draw animation.
ACT_SLAM_TRIPMINE_DRAW = nil

--- SLAM tripmine attach animation.
ACT_SLAM_TRIPMINE_ATTACH = nil

--- SLAM tripmine attach 2 animation.
ACT_SLAM_TRIPMINE_ATTACH2 = nil

--- SLAM tripmine to stickwall no-draw animation.
ACT_SLAM_TRIPMINE_TO_STICKWALL_ND = nil

--- SLAM tripmine to throw no-draw animation.
ACT_SLAM_TRIPMINE_TO_THROW_ND = nil

--- SLAM detonator idle animation.
ACT_SLAM_DETONATOR_IDLE = nil

--- SLAM detonator draw animation.
ACT_SLAM_DETONATOR_DRAW = nil

--- SLAM detonator detonate animation.
ACT_SLAM_DETONATOR_DETONATE = nil

--- SLAM detonator holster animation.
ACT_SLAM_DETONATOR_HOLSTER = nil

--- SLAM detonator stickwall draw animation.
ACT_SLAM_DETONATOR_STICKWALL_DRAW = nil

--- SLAM detonator throw draw animation.
ACT_SLAM_DETONATOR_THROW_DRAW = nil

--- Shotgun reload start animation.
ACT_SHOTGUN_RELOAD_START = nil

--- Shotgun reload finish animation.
ACT_SHOTGUN_RELOAD_FINISH = nil

--- Shotgun pump animation.
ACT_SHOTGUN_PUMP = nil

--- SMG2 second idle animation.
ACT_SMG2_IDLE2 = nil

--- SMG2 second fire animation.
ACT_SMG2_FIRE2 = nil

--- SMG2 second draw animation.
ACT_SMG2_DRAW2 = nil

--- SMG2 second reload animation.
ACT_SMG2_RELOAD2 = nil

--- SMG2 second dry fire animation.
ACT_SMG2_DRYFIRE2 = nil

--- SMG2 to auto mode animation.
ACT_SMG2_TOAUTO = nil

--- SMG2 to burst mode animation.
ACT_SMG2_TOBURST = nil

--- Physcannon upgrade animation.
ACT_PHYSCANNON_UPGRADE = nil

--- AR1 range attack animation.
ACT_RANGE_ATTACK_AR1 = nil

--- AR2 range attack animation.
ACT_RANGE_ATTACK_AR2 = nil

--- AR2 low range attack animation.
ACT_RANGE_ATTACK_AR2_LOW = nil

--- AR2 grenade range attack animation.
ACT_RANGE_ATTACK_AR2_GRENADE = nil

--- HMG1 range attack animation.
ACT_RANGE_ATTACK_HMG1 = nil

--- ML range attack animation.
ACT_RANGE_ATTACK_ML = nil

--- SMG1 range attack animation.
ACT_RANGE_ATTACK_SMG1 = nil

--- SMG1 low range attack animation.
ACT_RANGE_ATTACK_SMG1_LOW = nil

--- SMG2 range attack animation.
ACT_RANGE_ATTACK_SMG2 = nil

--- Shotgun range attack animation.
ACT_RANGE_ATTACK_SHOTGUN = nil

--- Shotgun low range attack animation.
ACT_RANGE_ATTACK_SHOTGUN_LOW = nil

--- Pistol range attack animation.
ACT_RANGE_ATTACK_PISTOL = nil

--- Pistol low range attack animation.
ACT_RANGE_ATTACK_PISTOL_LOW = nil

--- SLAM range attack animation.
ACT_RANGE_ATTACK_SLAM = nil

--- Tripmine range attack animation.
ACT_RANGE_ATTACK_TRIPWIRE = nil

--- Throw range attack animation.
ACT_RANGE_ATTACK_THROW = nil

--- Sniper rifle range attack animation.
ACT_RANGE_ATTACK_SNIPER_RIFLE = nil

--- RPG range attack animation.
ACT_RANGE_ATTACK_RPG = nil

--- Melee attack swing animation.
ACT_MELEE_ATTACK_SWING = nil

--- Low range aim animation.
ACT_RANGE_AIM_LOW = nil

--- SMG1 low range aim animation.
ACT_RANGE_AIM_SMG1_LOW = nil

--- Pistol low range aim animation.
ACT_RANGE_AIM_PISTOL_LOW = nil

--- AR2 low range aim animation.
ACT_RANGE_AIM_AR2_LOW = nil

--- Pistol low cover animation.
ACT_COVER_PISTOL_LOW = nil

--- SMG1 low cover animation.
ACT_COVER_SMG1_LOW = nil

--- AR1 range attack gesture.
ACT_GESTURE_RANGE_ATTACK_AR1 = nil

--- AR2 range attack gesture.
ACT_GESTURE_RANGE_ATTACK_AR2 = nil

--- AR2 grenade range attack gesture.
ACT_GESTURE_RANGE_ATTACK_AR2_GRENADE = nil

--- HMG1 range attack gesture.
ACT_GESTURE_RANGE_ATTACK_HMG1 = nil

--- ML range attack gesture.
ACT_GESTURE_RANGE_ATTACK_ML = nil

--- SMG1 range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SMG1 = nil

--- SMG1 low range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SMG1_LOW = nil

--- SMG2 range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SMG2 = nil

--- Shotgun range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SHOTGUN = nil

--- Pistol range attack gesture.
ACT_GESTURE_RANGE_ATTACK_PISTOL = nil

--- Pistol low range attack gesture.
ACT_GESTURE_RANGE_ATTACK_PISTOL_LOW = nil

--- SLAM range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SLAM = nil

--- Tripmire range attack gesture.
ACT_GESTURE_RANGE_ATTACK_TRIPWIRE = nil

--- Throw range attack gesture.
ACT_GESTURE_RANGE_ATTACK_THROW = nil

--- Sniper rifle range attack gesture.
ACT_GESTURE_RANGE_ATTACK_SNIPER_RIFLE = nil

--- Melee attack swing gesture.
ACT_GESTURE_MELEE_ATTACK_SWING = nil

--- Rifle idle animation.
ACT_IDLE_RIFLE = nil

--- SMG1 idle animation.
ACT_IDLE_SMG1 = nil

--- Angry SMG1 idle animation.
ACT_IDLE_ANGRY_SMG1 = nil

--- Pistol idle animation.
ACT_IDLE_PISTOL = nil

--- Angry pistol idle animation.
ACT_IDLE_ANGRY_PISTOL = nil

--- Angry shotgun idle animation.
ACT_IDLE_ANGRY_SHOTGUN = nil

--- Stealth pistol idle animation.
ACT_IDLE_STEALTH_PISTOL = nil

--- Package idle animation.
ACT_IDLE_PACKAGE = nil

--- Package walk animation.
ACT_WALK_PACKAGE = nil

--- Suitcase idle animation.
ACT_IDLE_SUITCASE = nil

--- Suitcase walk animation.
ACT_WALK_SUITCASE = nil

--- SMG1 relaxed idle animation.
ACT_IDLE_SMG1_RELAXED = nil

--- SMG1 stimulated idle animation.
ACT_IDLE_SMG1_STIMULATED = nil

--- Rifle relaxed walk animation.
ACT_WALK_RIFLE_RELAXED = nil

--- Rifle relaxed run animation.
ACT_RUN_RIFLE_RELAXED = nil

--- Rifle stimulated walk animation.
ACT_WALK_RIFLE_STIMULATED = nil

--- Rifle stimulated run animation.
ACT_RUN_RIFLE_STIMULATED = nil

--- Rifle stimulated aiming idle animation.
ACT_IDLE_AIM_RIFLE_STIMULATED = nil

--- Rifle stimulated aiming walk animation.
ACT_WALK_AIM_RIFLE_STIMULATED = nil

--- Rifle stimulated aiming run animation.
ACT_RUN_AIM_RIFLE_STIMULATED = nil

--- Shotgun relaxed idle animation.
ACT_IDLE_SHOTGUN_RELAXED = nil

--- Shotgun stimulated idle animation.
ACT_IDLE_SHOTGUN_STIMULATED = nil

--- Shotgun agitated idle animation.
ACT_IDLE_SHOTGUN_AGITATED = nil

--- Angry walk animation.
ACT_WALK_ANGRY = nil

--- Police harass animation 1.
ACT_POLICE_HARASS1 = nil

--- Police harass animation 2.
ACT_POLICE_HARASS2 = nil

--- Manned gun idle animation.
ACT_IDLE_MANNEDGUN = nil

--- Melee idle animation.
ACT_IDLE_MELEE = nil

--- Angry melee idle animation.
ACT_IDLE_ANGRY_MELEE = nil

--- RPG relaxed idle animation.
ACT_IDLE_RPG_RELAXED = nil

--- RPG idle animation.
ACT_IDLE_RPG = nil

--- Angry RPG idle animation.
ACT_IDLE_ANGRY_RPG = nil

--- RPG low cover animation.
ACT_COVER_LOW_RPG = nil

--- RPG walk animation.
ACT_WALK_RPG = nil

--- RPG run animation.
ACT_RUN_RPG = nil

--- RPG crouching walk animation.
ACT_WALK_CROUCH_RPG = nil

--- RPG crouching run animation.
ACT_RUN_CROUCH_RPG = nil

--- RPG relaxed walk animation.
ACT_WALK_RPG_RELAXED = nil

--- RPG relaxed run animation.
ACT_RUN_RPG_RELAXED = nil

--- Rifle walk animation.
ACT_WALK_RIFLE = nil

--- Rifle aiming walk animation.
ACT_WALK_AIM_RIFLE = nil

--- Rifle crouching walk animation.
ACT_WALK_CROUCH_RIFLE = nil

--- Rifle aiming crouching walk animation.
ACT_WALK_CROUCH_AIM_RIFLE = nil

--- Rifle run animation.
ACT_RUN_RIFLE = nil

--- Rifle aiming run animation.
ACT_RUN_AIM_RIFLE = nil

--- Rifle crouching run animation.
ACT_RUN_CROUCH_RIFLE = nil

--- Rifle aiming crouching run animation.
ACT_RUN_CROUCH_AIM_RIFLE = nil

--- Stealth pistol run animation.
ACT_RUN_STEALTH_PISTOL = nil

--- Shotgun aiming walk animation.
ACT_WALK_AIM_SHOTGUN = nil

--- Shotgun aiming run animation.
ACT_RUN_AIM_SHOTGUN = nil

--- Pistol walk animation.
ACT_WALK_PISTOL = nil

--- Pistol run animation.
ACT_RUN_PISTOL = nil

--- Pistol aiming walk animation.
ACT_WALK_AIM_PISTOL = nil

--- Pistol aiming run animation.
ACT_RUN_AIM_PISTOL = nil

--- Stealth pistol walk animation.
ACT_WALK_STEALTH_PISTOL = nil

--- Stealth pistol aiming walk animation.
ACT_WALK_AIM_STEALTH_PISTOL = nil

--- Stealth pistol aiming run animation.
ACT_RUN_AIM_STEALTH_PISTOL = nil

--- Pistol reload animation.
ACT_RELOAD_PISTOL = nil

--- Pistol low reload animation.
ACT_RELOAD_PISTOL_LOW = nil

--- SMG1 reload animation.
ACT_RELOAD_SMG1 = nil

--- SMG1 low reload animation.
ACT_RELOAD_SMG1_LOW = nil

--- Shotgun reload animation.
ACT_RELOAD_SHOTGUN = nil

--- Shotgun low reload animation.
ACT_RELOAD_SHOTGUN_LOW = nil

--- Reload gesture.
ACT_GESTURE_RELOAD = nil

--- Pistol reload gesture.
ACT_GESTURE_RELOAD_PISTOL = nil

--- SMG1 reload gesture.
ACT_GESTURE_RELOAD_SMG1 = nil

--- Shotgun reload gesture.
ACT_GESTURE_RELOAD_SHOTGUN = nil

--- Lean left busy animation.
ACT_BUSY_LEAN_LEFT = nil

--- Lean left entry busy animation.
ACT_BUSY_LEAN_LEFT_ENTRY = nil

--- Lean left exit busy animation.
ACT_BUSY_LEAN_LEFT_EXIT = nil

--- Lean back busy animation.
ACT_BUSY_LEAN_BACK = nil

--- Lean back entry busy animation.
ACT_BUSY_LEAN_BACK_ENTRY = nil

--- Lean back exit busy animation.
ACT_BUSY_LEAN_BACK_EXIT = nil

--- Sit ground busy animation.
ACT_BUSY_SIT_GROUND = nil

--- Sit ground entry busy animation.
ACT_BUSY_SIT_GROUND_ENTRY = nil

--- Sit ground exit busy animation.
ACT_BUSY_SIT_GROUND_EXIT = nil

--- Sit chair busy animation.
ACT_BUSY_SIT_CHAIR = nil

--- Sit chair entry busy animation.
ACT_BUSY_SIT_CHAIR_ENTRY = nil

--- Sit chair exit busy animation.
ACT_BUSY_SIT_CHAIR_EXIT = nil

--- Stand busy animation.
ACT_BUSY_STAND = nil

--- Queue busy animation.
ACT_BUSY_QUEUE = nil

--- Duck and dodge animation.
ACT_DUCK_DODGE = nil

--- Barnacle swallow death animation.
ACT_DIE_BARNACLE_SWALLOW = nil

--- Barnacle strangle gesture.
ACT_GESTURE_BARNACLE_STRANGLE = nil

--- Physcannon detach animation.
ACT_PHYSCANNON_DETACH = nil

--- Physcannon animate animation.
ACT_PHYSCANNON_ANIMATE = nil

--- Physcannon animate pre-animation.
ACT_PHYSCANNON_ANIMATE_PRE = nil

--- Physcannon animate post-animation.
ACT_PHYSCANNON_ANIMATE_POST = nil

--- Death from front side.
ACT_DIE_FRONTSIDE = nil

--- Death from right side.
ACT_DIE_RIGHTSIDE = nil

--- Death from back side.
ACT_DIE_BACKSIDE = nil

--- Death from left side.
ACT_DIE_LEFTSIDE = nil

--- Open door animation.
ACT_OPEN_DOOR = nil

--- Alyx zombie melee dynamic interaction.
ACT_DI_ALYX_ZOMBIE_MELEE = nil

--- Alyx zombie torso melee dynamic interaction.
ACT_DI_ALYX_ZOMBIE_TORSO_MELEE = nil

--- Alyx headcrab melee dynamic interaction.
ACT_DI_ALYX_HEADCRAB_MELEE = nil

--- Alyx antlion dynamic interaction.
ACT_DI_ALYX_ANTLION = nil

--- Alyx zombie shotgun 64 dynamic interaction.
ACT_DI_ALYX_ZOMBIE_SHOTGUN64 = nil

--- Alyx zombie shotgun 26 dynamic interaction.
ACT_DI_ALYX_ZOMBIE_SHOTGUN26 = nil

--- Readiness transition from relaxed to stimulated.
ACT_READINESS_RELAXED_TO_STIMULATED = nil

--- Readiness walk transition from relaxed to stimulated.
ACT_READINESS_RELAXED_TO_STIMULATED_WALK = nil

--- Readiness transition from agitated to stimulated.
ACT_READINESS_AGITATED_TO_STIMULATED = nil

--- Readiness transition from stimulated to relaxed.
ACT_READINESS_STIMULATED_TO_RELAXED = nil

--- Pistol readiness transition from relaxed to stimulated.
ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED = nil

--- Pistol readiness walk transition from relaxed to stimulated.
ACT_READINESS_PISTOL_RELAXED_TO_STIMULATED_WALK = nil

--- Pistol readiness transition from agitated to stimulated.
ACT_READINESS_PISTOL_AGITATED_TO_STIMULATED = nil

--- Pistol readiness transition from stimulated to relaxed.
ACT_READINESS_PISTOL_STIMULATED_TO_RELAXED = nil

--- Idle carry animation.
ACT_IDLE_CARRY = nil

--- Walk carry animation.
ACT_WALK_CARRY = nil

--- HL2MP idle animation.
ACT_HL2MP_IDLE = nil

--- HL2MP running animation.
ACT_HL2MP_RUN = nil

--- HL2MP walking animation.
ACT_HL2MP_WALK = nil

--- HL2MP jumping animation.
ACT_HL2MP_JUMP = nil

--- HL2MP idle crouch animation.
ACT_HL2MP_IDLE_CROUCH = nil

--- HL2MP walking crouch animation.
ACT_HL2MP_WALK_CROUCH = nil

--- HL2MP gesture for range attack.
ACT_HL2MP_GESTURE_RANGE_ATTACK = nil

--- HL2MP gesture for melee attack.
ACT_HL2MP_GESTURE_MELEE_ATTACK = nil

--- HL2MP gesture for reload.
ACT_HL2MP_GESTURE_RELOAD = nil

--- HL2MP idle animation for pistol.
ACT_HL2MP_IDLE_PISTOL = nil

--- HL2MP running animation for pistol.
ACT_HL2MP_RUN_PISTOL = nil

--- HL2MP walking animation for pistol.
ACT_HL2MP_WALK_PISTOL = nil

--- HL2MP jumping animation for pistol.
ACT_HL2MP_JUMP_PISTOL = nil

--- HL2MP idle crouch animation for pistol.
ACT_HL2MP_IDLE_CROUCH_PISTOL = nil

--- HL2MP walking crouch animation for pistol.
ACT_HL2MP_WALK_CROUCH_PISTOL = nil

--- HL2MP gesture for range attack with pistol.
ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL = nil

--- HL2MP gesture for melee attack with pistol.
ACT_HL2MP_GESTURE_MELEE_ATTACK_PISTOL = nil

--- HL2MP gesture for reload with pistol.
ACT_HL2MP_GESTURE_RELOAD_PISTOL = nil

--- HL2MP idle animation for SMG.
ACT_HL2MP_IDLE_SMG1 = nil

--- HL2MP running animation for SMG.
ACT_HL2MP_RUN_SMG1 = nil

--- HL2MP walking animation for SMG.
ACT_HL2MP_WALK_SMG1 = nil

--- HL2MP jumping animation for SMG.
ACT_HL2MP_JUMP_SMG1 = nil

--- HL2MP idle crouch animation for SMG.
ACT_HL2MP_IDLE_CROUCH_SMG1 = nil

--- HL2MP walking crouch animation for SMG.
ACT_HL2MP_WALK_CROUCH_SMG1 = nil

--- HL2MP gesture for range attack with SMG.
ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1 = nil

--- HL2MP gesture for melee attack with SMG.
ACT_HL2MP_GESTURE_MELEE_ATTACK_SMG1 = nil

--- HL2MP gesture for reload with SMG.
ACT_HL2MP_GESTURE_RELOAD_SMG1 = nil

--- HL2MP idle animation for AR2.
ACT_HL2MP_IDLE_AR2 = nil

--- HL2MP running animation for AR2.
ACT_HL2MP_RUN_AR2 = nil

--- HL2MP walking animation for AR2.
ACT_HL2MP_WALK_AR2 = nil

--- HL2MP jumping animation for AR2.
ACT_HL2MP_JUMP_AR2 = nil

--- HL2MP idle crouch animation for AR2.
ACT_HL2MP_IDLE_CROUCH_AR2 = nil

--- HL2MP walking crouch animation for AR2.
ACT_HL2MP_WALK_CROUCH_AR2 = nil

--- HL2MP gesture for range attack with AR2.
ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 = nil

--- HL2MP gesture for melee attack with AR2.
ACT_HL2MP_GESTURE_MELEE_ATTACK_AR2 = nil

--- HL2MP gesture for reload with AR2.
ACT_HL2MP_GESTURE_RELOAD_AR2 = nil

--- HL2MP idle animation for shotgun.
ACT_HL2MP_IDLE_SHOTGUN = nil

--- HL2MP running animation for shotgun.
ACT_HL2MP_RUN_SHOTGUN = nil

--- HL2MP walking animation for shotgun.
ACT_HL2MP_WALK_SHOTGUN = nil

--- HL2MP jumping animation for shotgun.
ACT_HL2MP_JUMP_SHOTGUN = nil

--- HL2MP idle crouch animation for shotgun.
ACT_HL2MP_IDLE_CROUCH_SHOTGUN = nil

--- HL2MP walking crouch animation for shotgun.
ACT_HL2MP_WALK_CROUCH_SHOTGUN = nil

--- HL2MP gesture for range attack with shotgun.
ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN = nil

--- HL2MP gesture for melee attack with shotgun.
ACT_HL2MP_GESTURE_MELEE_ATTACK_SHOTGUN = nil

--- HL2MP gesture for reload with shotgun.
ACT_HL2MP_GESTURE_RELOAD_SHOTGUN = nil

--- HL2MP idle animation for RPG.
ACT_HL2MP_IDLE_RPG = nil

--- HL2MP running animation for RPG.
ACT_HL2MP_RUN_RPG = nil

--- HL2MP walking animation for RPG.
ACT_HL2MP_WALK_RPG = nil

--- HL2MP jumping animation for RPG.
ACT_HL2MP_JUMP_RPG = nil

--- HL2MP idle crouch animation for RPG.
ACT_HL2MP_IDLE_CROUCH_RPG = nil

--- HL2MP walking crouch animation for RPG.
ACT_HL2MP_WALK_CROUCH_RPG = nil

--- HL2MP gesture for range attack with RPG.
ACT_HL2MP_GESTURE_RANGE_ATTACK_RPG = nil

--- HL2MP gesture for melee attack with RPG.
ACT_HL2MP_GESTURE_MELEE_ATTACK_RPG = nil

--- HL2MP gesture for reload with RPG.
ACT_HL2MP_GESTURE_RELOAD_RPG = nil

--- HL2MP idle animation for grenade.
ACT_HL2MP_IDLE_GRENADE = nil

--- HL2MP running animation for grenade.
ACT_HL2MP_RUN_GRENADE = nil

--- HL2MP walking animation for grenade.
ACT_HL2MP_WALK_GRENADE = nil

--- HL2MP jumping animation for grenade.
ACT_HL2MP_JUMP_GRENADE = nil

--- HL2MP idle crouch animation for grenade.
ACT_HL2MP_IDLE_CROUCH_GRENADE = nil

--- HL2MP walking crouch animation for grenade.
ACT_HL2MP_WALK_CROUCH_GRENADE = nil

--- HL2MP gesture for range attack with grenade.
ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE = nil

--- HL2MP gesture for melee attack with grenade.
ACT_HL2MP_GESTURE_MELEE_ATTACK_GRENADE = nil

--- HL2MP gesture for reload with grenade.
ACT_HL2MP_GESTURE_RELOAD_GRENADE = nil

--- HL2MP idle animation for crossbow.
ACT_HL2MP_IDLE_CROSSBOW = nil

--- HL2MP running animation for crossbow.
ACT_HL2MP_RUN_CROSSBOW = nil

--- HL2MP walking animation for crossbow.
ACT_HL2MP_WALK_CROSSBOW = nil

--- HL2MP jumping animation for crossbow.
ACT_HL2MP_JUMP_CROSSBOW = nil

--- HL2MP idle crouch animation for crossbow.
ACT_HL2MP_IDLE_CROUCH_CROSSBOW = nil

--- HL2MP walking crouch animation for crossbow.
ACT_HL2MP_WALK_CROUCH_CROSSBOW = nil

--- HL2MP gesture for range attack with crossbow.
ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW = nil

--- HL2MP gesture for melee attack with crossbow.
ACT_HL2MP_GESTURE_MELEE_ATTACK_CROSSBOW = nil

--- HL2MP gesture for reload with crossbow.
ACT_HL2MP_GESTURE_RELOAD_CROSSBOW = nil

--- HL2MP idle animation for crowbar.
ACT_HL2MP_IDLE_CROWBAR = nil

--- HL2MP running animation for crowbar.
ACT_HL2MP_RUN_CROWBAR = nil

--- HL2MP walking animation for crowbar.
ACT_HL2MP_WALK_CROWBAR = nil

--- HL2MP jumping animation for crowbar.
ACT_HL2MP_JUMP_CROWBAR = nil

--- HL2MP idle crouch animation for crowbar.
ACT_HL2MP_IDLE_CROUCH_CROWBAR = nil

--- HL2MP walking crouch animation for crowbar.
ACT_HL2MP_WALK_CROUCH_CROWBAR = nil

--- HL2MP gesture for range attack with crowbar.
ACT_HL2MP_GESTURE_RANGE_ATTACK_CROWBAR = nil

--- HL2MP gesture for melee attack with crowbar.
ACT_HL2MP_GESTURE_MELEE_ATTACK_CROWBAR = nil

--- HL2MP gesture for reload with crowbar.
ACT_HL2MP_GESTURE_RELOAD_CROWBAR = nil

--- HL2MP idle animation for stunstick.
ACT_HL2MP_IDLE_STUNSTICK = nil

--- HL2MP running animation for stunstick.
ACT_HL2MP_RUN_STUNSTICK = nil

--- HL2MP walking animation for stunstick.
ACT_HL2MP_WALK_STUNSTICK = nil

--- HL2MP jumping animation for stunstick.
ACT_HL2MP_JUMP_STUNSTICK = nil

--- HL2MP idle crouch animation for stunstick.
ACT_HL2MP_IDLE_CROUCH_STUNSTICK = nil

--- HL2MP walking crouch animation for stunstick.
ACT_HL2MP_WALK_CROUCH_STUNSTICK = nil

--- HL2MP gesture for range attack with stunstick.
ACT_HL2MP_GESTURE_RANGE_ATTACK_STUNSTICK = nil

--- HL2MP gesture for melee attack with stunstick.
ACT_HL2MP_GESTURE_MELEE_ATTACK_STUNSTICK = nil

--- HL2MP gesture for reload with stunstick.
ACT_HL2MP_GESTURE_RELOAD_STUNSTICK = nil

--- HL2MP idle animation for melee.
ACT_HL2MP_IDLE_MELEE = nil

--- HL2MP running animation for melee.
ACT_HL2MP_RUN_MELEE = nil

--- HL2MP walking animation for melee.
ACT_HL2MP_WALK_MELEE = nil

--- HL2MP jumping animation for melee.
ACT_HL2MP_JUMP_MELEE = nil

--- HL2MP idle crouch animation for melee.
ACT_HL2MP_IDLE_CROUCH_MELEE = nil

--- HL2MP walking crouch animation for melee.
ACT_HL2MP_WALK_CROUCH_MELEE = nil

--- HL2MP gesture for range attack with melee.
ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE = nil

--- HL2MP gesture for melee attack with melee.
ACT_HL2MP_GESTURE_MELEE_ATTACK_MELEE = nil

--- HL2MP gesture for reload with melee.
ACT_HL2MP_GESTURE_RELOAD_MELEE = nil

--- HL2MP idle animation for slam.
ACT_HL2MP_IDLE_SLAM = nil

--- HL2MP running animation for slam.
ACT_HL2MP_RUN_SLAM = nil

--- HL2MP walking animation for slam.
ACT_HL2MP_WALK_SLAM = nil

--- HL2MP jumping animation for slam.
ACT_HL2MP_JUMP_SLAM = nil

--- HL2MP idle crouch animation for slam.
ACT_HL2MP_IDLE_CROUCH_SLAM = nil

--- HL2MP walking crouch animation for slam.
ACT_HL2MP_WALK_CROUCH_SLAM = nil

--- HL2MP gesture for range attack with slam.
ACT_HL2MP_GESTURE_RANGE_ATTACK_SLAM = nil

--- HL2MP gesture for melee attack with slam.
ACT_HL2MP_GESTURE_MELEE_ATTACK_SLAM = nil

--- HL2MP gesture for reload with slam.
ACT_HL2MP_GESTURE_RELOAD_SLAM = nil

--- HL2MP idle animation for physgun.
ACT_HL2MP_IDLE_PHYSGUN = nil

--- HL2MP running animation for physgun.
ACT_HL2MP_RUN_PHYSGUN = nil

--- HL2MP walking animation for physgun.
ACT_HL2MP_WALK_PHYSGUN = nil

--- HL2MP jumping animation for physgun.
ACT_HL2MP_JUMP_PHYSGUN = nil

--- HL2MP idle crouch animation for physgun.
ACT_HL2MP_IDLE_CROUCH_PHYSGUN = nil

--- HL2MP walking crouch animation for physgun.
ACT_HL2MP_WALK_CROUCH_PHYSGUN = nil

--- HL2MP gesture for range attack with physgun.
ACT_HL2MP_GESTURE_RANGE_ATTACK_PHYSGUN = nil

--- HL2MP gesture for melee attack with physgun.
ACT_HL2MP_GESTURE_MELEE_ATTACK_PHYSGUN = nil

--- HL2MP gesture for reload with physgun.
ACT_HL2MP_GESTURE_RELOAD_PHYSGUN = nil

-- end activities