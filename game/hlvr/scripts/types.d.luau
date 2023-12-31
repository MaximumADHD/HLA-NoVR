type float = number
type int = number

type table = {
    [any]: any
}

type handle = any
type ehandle = any
declare class Quaternion end -- broken type?

declare class Vector
    x: number
    y: number
    z: number

    function __add(self, other: Vector): Vector
    function __sub(self, other: Vector): Vector
    function __mul(self, other: Vector | number): Vector
    function __div(self, other: Vector | number): Vector
    function __eq(self, other: Vector): boolean
    function __tostring(self): string
    function __unm(self): Vector
    function __len(self): float
    
    function Cross(self, other: Vector): Vector
    function Dot(self, other: Vector): float
    function Length(self): float
    function Length2D(self): float
    function Lerp(self, other: Vector, t: float): Vector
    function Normalized(self): Vector
end

declare class QAngle
    x: number
    y: number
    z: number

    function __add(self, other: QAngle): QAngle
    function __eq(self, other: QAngle): boolean
    function __tostring(self): string
    
    function Forward(self): Vector
    function Left(self): Vector
    function Up(self): Vector
end

declare function Vector(x: float?, y: float?, z: float?): Vector
declare function QAngle(x: float?, y: float?, z: float?): QAngle

-- utilsinit.lua
declare function abs(val: float): float
declare function Clamp(val: float, min: float, max: float): float
declare function Deg2Rad(deg: float): float
declare function Rad2Deg(rad: float): float
declare function Lerp(t: float, a: float, b: float): float
declare function max(...: float): float
declare function min(...: float): float
declare function Merge(t1: table, t2: table): table
declare function RemapVal(input: float, a: float, b: float, c: float, d: float): float
declare function RemapValClamped(input: float, a: float, b: float, c: float, d: float): float
declare function VectorDistanceSq(a: Vector, b: Vector): float
declare function VectorDistance(a: Vector, b: Vector): float
declare function VectorLerp(t: float, v1: Vector, v2: Vector): Vector
declare function VectorIsZero(v: Vector): boolean

declare vlua: {
    clear: (t: table) -> table,
    compare: (a: float, b: float) -> int,
    contains: <K>(t: table, key: K) -> boolean,
    delete: <K, V>(t: table, key: K) -> V?,
    clone: (t: table) -> table?,
    rawdelete: <K, V>(t: table, key: K) -> V?,
    rawin: <K>(t: table, key: K) -> boolean,
    find: ((o: string, value: string, startIndex: int?) -> string) & <K, V>(o: { [K]: V }, value: V) -> K?,
    slice: (o: table | string, startIndex: int, endIndex: int?) -> any,
    reverse: (o: table) -> table,
    resize: (o: table, size: int, fill: any?) -> table,
    extend: (o: table, array: {any}) -> table,
    map: <K, In, Out>(o: { [K]: In }, callback: (In) -> Out) -> { [K]: Out },
    reduce: <V>(o: { V }, fn: (V, V) -> V) -> V,
    tableadd: (t1: table, t2: table) -> table,
    split: (s: string, sep: string) -> {string},
    select: (cond: boolean, valueIfTrue: any, valueIfFalse: any) -> any,
}

---[[ AngleDiff  Returns the number of degrees difference between two yaw angles ]]
-- @return float
-- @param float_1: float
-- @param float_2: float
declare function AngleDiff(ang1: float, ang2: float): float

---[[ AnglesToVector  Generate a vector given a QAngles ]]
-- @return Vector
-- @param QAngle_1: QAngle
declare function AnglesToVector( angle: QAngle ): Vector

---[[ AppendToLogFile  AppendToLogFile is deprecated. Print to the console for logging instead. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
declare function AppendToLogFile( string_1: string, string_2: string )

---[[ AxisAngleToQuaternion  (vector,float) constructs a quaternion representing a rotation by angle around the specified vector axis ]]
-- @return Quaternion
-- @param Vector_1: Vector
-- @param float_2: float
declare function AxisAngleToQuaternion( vec: Vector, angle: float ): Quaternion

---[[ CalcClosestPointOnEntityOBB  Compute the closest point on the OBB of an entity. ]]
-- @return Vector
-- @param handle_1: handle
-- @param Vector_2: Vector
declare function CalcClosestPointOnEntityOBB( entity: handle, pos: Vector )

---[[ CalcDistanceBetweenEntityOBB  Compute the distance between two entity OBB. A negative return value indicates an input error. A return value of zero indicates that the OBBs are overlapping. ]]
-- @return float
-- @param handle_1: handle
-- @param handle_2: handle
declare function CalcDistanceBetweenEntityOBB( entity1: handle, entity2: handle )

---[[ CalcDistanceToLineSegment2D   ]]
-- @return float
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
declare function CalcDistanceToLineSegment2D( Vector_1: Vector, Vector_2: Vector, Vector_3: Vector )

---[[ CancelEntityIOEvents  Create all I/O events for a particular entity ]]
-- @return void
-- @param ehandle_1: ehandle
declare function CancelEntityIOEvents( ehandle_1: ehandle )

---[[ CreateDamageInfo  (hInflictor, hAttacker, flDamage) - Allocate a damageinfo object, used as an argument to TakeDamage(). Call DestroyDamageInfo( hInfo ) to free the object. ]]
-- @return handle
-- @param handle_1: handle
-- @param handle_2: handle
-- @param Vector_3: Vector
-- @param Vector_4: Vector
-- @param float_5: float
-- @param int_6: int
declare function CreateDamageInfo( hInflictor: handle, hAttacker: handle, force: Vector, hitPos: Vector, flDamage: float, damageTypes: int ): handle

---[[ CreateEffect  Pass table - Inputs: entity, effect ]]
-- @return bool
-- @param handle_1: handle
declare function CreateEffect( handle_1: handle ): boolean

---[[ CreateSceneEntity  Create a scene entity to play the specified scene. ]]
-- @return handle
-- @param string_1: string
declare function CreateSceneEntity( string_1: string )

---[[ CreateTrigger  CreateTrigger( vecMin, vecMax ) : Creates and returns an AABB trigger ]]
-- @return handle
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
declare function CreateTrigger( Vector_1: Vector, Vector_2: Vector, Vector_3: Vector )

---[[ CreateTriggerRadiusApproximate  CreateTriggerRadiusApproximate( vecOrigin, flRadius ) : Creates and returns an AABB trigger thats bigger than the radius provided ]]
-- @return handle
-- @param Vector_1: Vector
-- @param float_2: float
declare function CreateTriggerRadiusApproximate( Vector_1: Vector, float_2: float )

---[[ CrossVectors  (vector,vector) cross product between two vectors ]]
-- @return Vector
-- @param Vector_1: Vector
-- @param Vector_2: Vector
declare function CrossVectors( Vector_1: Vector, Vector_2: Vector )

---[[ DebugBreak  Breaks in the debugger ]]
-- @return void
declare function DebugBreak(  )

---[[ DebugDrawBox  Draw a debug overlay box (origin, mins, maxs, forward, r, g, b, a, duration ) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param float_8: float
declare function DebugDrawBox( Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, int_4: int, int_5: int, int_6: int, int_7: int, float_8: float )

---[[ DebugDrawBoxDirection  Draw a debug forward box (cent, min, max, forward, vRgb, a, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param Vector_4: Vector
-- @param Vector_5: Vector
-- @param float_6: float
-- @param float_7: float
declare function DebugDrawBoxDirection( Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, Vector_4: Vector, Vector_5: Vector, float_6: float, float_7: float )

---[[ DebugDrawCircle  Draw a debug circle (center, vRgb, a, rad, ztest, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param float_4: float
-- @param bool_5: boolean
-- @param float_6: float
declare function DebugDrawCircle( Vector_1: Vector, Vector_2: Vector, float_3: float, float_4: float, bool_5: boolean, float_6: float )

---[[ DebugDrawClear  Try to clear all the debug overlay info ]]
-- @return void
declare function DebugDrawClear(  )

---[[ DebugDrawLine  Draw a debug overlay line (origin, target, r, g, b, ztest, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param bool_6: boolean
-- @param float_7: float
declare function DebugDrawLine( Vector_1: Vector, Vector_2: Vector, int_3: int, int_4: int, int_5: int, bool_6: boolean, float_7: float )

---[[ DebugDrawLine_vCol  Draw a debug line using color vec (start,, vRgb, a, ztest, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param bool_4: boolean
-- @param float_5: float
declare function DebugDrawLine_vCol( Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, bool_4: boolean, float_5: float )

---[[ DebugDrawScreenTextLine  Draw text with a line offset (x, y, lineOffset, text, r, g, b, a, duration) ]]
-- @return void
-- @param float_1: float
-- @param float_2: float
-- @param int_3: int
-- @param string_4: string
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param float_9: float
declare function DebugDrawScreenTextLine( float_1: float, float_2: float, int_3: int, string_4: string, int_5: int, int_6: int, int_7: int, int_8: int, float_9: float )

---[[ DebugDrawSphere  Draw a debug sphere (center, vRgb, a, rad, ztest, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param float_4: float
-- @param bool_5: boolean
-- @param float_6: float
declare function DebugDrawSphere( Vector_1: Vector, Vector_2: Vector, float_3: float, float_4: float, bool_5: boolean, float_6: float )

---[[ DebugDrawText  Draw text in 3d (origin, text, bViewCheck, duration) ]]
-- @return void
-- @param Vector_1: Vector
-- @param string_2: string
-- @param bool_3: boolean
-- @param float_4: float
declare function DebugDrawText( Vector_1: Vector, string_2: string, bool_3: boolean, float_4: float )

---[[ DebugScreenTextPretty  Draw pretty debug text (x, y, lineOffset, text, r, g, b, a, duration, font, size, bBold) ]]
-- @return void
-- @param float_1: float
-- @param float_2: float
-- @param int_3: int
-- @param string_4: string
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param float_9: float
-- @param string_10: string
-- @param int_11: int
-- @param bool_12: boolean
declare function DebugScreenTextPretty( x: float, y: float, lineOffset: int, text: string, r: int, g: int, b: int, a: int, duration: float, font: string, size: int, bBold: boolean )

---[[ DestroyDamageInfo  Free a damageinfo object that was created with CreateDamageInfo(). ]]
-- @return void
-- @param handle_1: handle
declare function DestroyDamageInfo( handle_1: handle )

---[[ DoEntFire  #EntFire:Generate and entity i/o event ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param string_3: string
-- @param float_4: float
-- @param handle_5: handle
-- @param handle_6: handle
declare function DoEntFire( string_1: string, string_2: string, string_3: string, float_4: float, handle_5: handle, handle_6: handle )

---[[ DoEntFireByInstanceHandle  #EntFireByHandle:Generate and entity i/o event ]]
-- @return void
-- @param handle_1: handle
-- @param string_2: string
-- @param string_3: string
-- @param float_4: float
-- @param handle_5: handle
-- @param handle_6: handle
declare function DoEntFireByInstanceHandle( handle_1: handle, string_2: string, string_3: string, float_4: float, handle_5: handle, handle_6: handle )

---[[ DoIncludeScript  Execute a script (internal) ]]
-- @return bool
-- @param string_1: string
-- @param handle_2: handle
declare function DoIncludeScript( string_1: string, handle_2: handle )

---[[ DoScriptAssert  #ScriptAssert:Asserts the passed in value. Prints out a message and brings up the assert dialog. ]]
-- @return void
-- @param bool_1: boolean
-- @param string_2: string
declare function DoScriptAssert( bool_1: boolean, string_2: string )

---[[ DoUniqueString  #UniqueString:Generate a string guaranteed to be unique across the life of the script VM, with an optional root string. Useful for adding data to tables when not sure what keys are already in use in that table. ]]
-- @return string
-- @param string_1: string
declare function DoUniqueString( string_1: string )

---[[ EmitSoundOn  Play named sound on Entity ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function EmitSoundOn( string_1: string, handle_2: handle )

---[[ EmitSoundOnClient  Play named sound only on the client for the passed in player ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function EmitSoundOnClient( string_1: string, handle_2: handle )

---[[ EntIndexToHScript  Turn an entity index integer to an HScript representing that entity's script instance. ]]
-- @return handle
-- @param int_1: int
declare function EntIndexToHScript( int_1: int ): CBaseEntity?

---[[ ExponentialDecay  Smooth curve decreasing slower as it approaches zero ]]
-- @return float
-- @param float_1: float
-- @param float_2: float
-- @param float_3: float
declare function ExponentialDecay( float_1: float, float_2: float, float_3: float )

---[[ FireEntityIOInputNameOnly  Fire Entity's Action Input w/no data ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param string_2: string
declare function FireEntityIOInputNameOnly( ehandle_1: ehandle, string_2: string )

---[[ FireEntityIOInputString  Fire Entity's Action Input with passed String - you own the memory ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param string_2: string
-- @param string_3: string
declare function FireEntityIOInputString( ehandle_1: ehandle, string_2: string, string_3: string )

---[[ FireEntityIOInputVec  Fire Entity's Action Input with passed Vector - you own the memory ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param string_2: string
-- @param Vector_3: Vector
declare function FireEntityIOInputVec( ehandle_1: ehandle, string_2: string, Vector_3: Vector )

---[[ FireGameEvent  Fire a game event. ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function FireGameEvent( string_1: string, handle_2: handle )

---[[ FireGameEventLocal  Fire a game event without broadcasting to the client. ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function FireGameEventLocal( string_1: string, handle_2: handle )

---[[ FrameTime  Get the time spent on the server in the last frame ]]
-- @return float
declare function FrameTime(  ): float

---[[ GetActiveSpawnGroupHandle  Returns the currently active spawn group handle ]]
-- @return int
declare function GetActiveSpawnGroupHandle(  ): int

---[[ GetFrameCount  Returns the engines current frame count ]]
-- @return int
declare function GetFrameCount(  ): int

---[[ GetListenServerHost  Get the local player on a listen server. ]]
-- @return handle
declare function GetListenServerHost(  ): CBasePlayer

---[[ GetMapName  Get the name of the map. ]]
-- @return string
declare function GetMapName(  ): string

---[[ GetMaxOutputDelay  Get the longest delay for all events attached to an output ]]
-- @return float
-- @param ehandle_1: ehandle
-- @param string_2: string
declare function GetMaxOutputDelay( ehandle_1: ehandle, string_2: string ): float

---[[ GetPhysAngularVelocity  Get Angular Velocity for VPHYS or normal object. Returns a vector of the axis of rotation, multiplied by the degrees of rotation per second. ]]
-- @return Vector
-- @param handle_1: handle
declare function GetPhysAngularVelocity( handle_1: handle ): Vector

---[[ GetPhysVelocity  Get Velocity for VPHYS or normal object ]]
-- @return Vector
-- @param handle_1: handle
declare function GetPhysVelocity( handle_1: handle ): Vector

---[[ InitLogFile  InitLogFile is deprecated. Print to the console for logging instead. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
declare function InitLogFile( string_1: string, string_2: string )

---[[ IsClient  Returns true if this is lua running from the client.dll. ]]
-- @return bool
declare function IsClient(  ): boolean

---[[ IsDedicatedServer  Returns true if this server is a dedicated server. ]]
-- @return bool
declare function IsDedicatedServer(  ): boolean

---[[ IsInToolsMode  Returns true if this is lua running within tools mode. ]]
-- @return bool
declare function IsInToolsMode(  ): boolean

---[[ IsMarkedForDeletion  Returns true if the entity is valid and marked for deletion. ]]
-- @return bool
-- @param handle_1: handle
declare function IsMarkedForDeletion( handle_1: handle ): boolean

---[[ IsServer  Returns true if this is lua running from the server.dll. ]]
-- @return bool
declare function IsServer(  ): boolean

---[[ IsValidEntity  Checks to see if the given hScript is a valid entity ]]
-- @return bool
-- @param handle_1: handle
declare function IsValidEntity( handle_1: handle ): boolean

---[[ LerpVectors  (vector,vector,float) lerp between two vectors by a float factor returning new vector ]]
-- @return Vector
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
declare function LerpVectors( Vector_1: Vector, Vector_2: Vector, float_3: float ): Vector

---[[ ListenToGameEvent  Register as a listener for a game event from script. ]]
-- @return int
-- @param string_1: string
-- @param handle_2: handle
-- @param handle_3: handle
declare function ListenToGameEvent( string_1: string, handle_2: handle, handle_3: handle ): int

---[[ LoadKeyValues  Creates a table from the specified keyvalues text file ]]
-- @return table
-- @param string_1: string
declare function LoadKeyValues( string_1: string ): table

---[[ LoadKeyValuesFromString  Creates a table from the specified keyvalues string ]]
-- @return table
-- @param string_1: string
declare function LoadKeyValuesFromString( string_1: string ): table

---[[ LocalTime  Get the current local time ]]
-- @return table
declare function LocalTime(  ): {
    Hours: int,
    Minutes: int,
    Seconds: int,
}

---[[ MakeStringToken  Checks to see if the given hScript is a valid entity ]]
-- @return int
-- @param string_1: string
declare function MakeStringToken( string_1: string ): int

---[[ ManuallyTriggerSpawnGroupCompletion  Triggers the creation of entities in a manually-completed spawn group ]]
-- @return void
-- @param int_1: int
declare function ManuallyTriggerSpawnGroupCompletion( int_1: int )

---[[ Msg  Print a message ]]
-- @return void
-- @param string_1: string
declare function Msg( string_1: string )

---[[ PlayerInstanceFromIndex  Get a script instance of a player by index. ]]
-- @return handle
-- @param int_1: int
declare function PlayerInstanceFromIndex( int_1: int )

---[[ PrecacheEntityFromTable  Precache an entity from KeyValues in table ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
-- @param handle_3: handle
declare function PrecacheEntityFromTable( string_1: string, handle_2: handle, handle_3: handle )

---[[ PrecacheEntityListFromTable  Precache a list of entity KeyValues tables ]]
-- @return void
-- @param handle_1: handle
-- @param handle_2: handle
declare function PrecacheEntityListFromTable( handle_1: handle, handle_2: handle )

---[[ PrecacheModel  ( modelName, context ) - Manually precache a single model ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function PrecacheModel( string_1: string, handle_2: handle )

---[[ PrecacheResource  ( resourceType, resourcePath, context ) - Manually precache a single resource. Types: "model|model_folder|sound|soundfile|particle|particle_folder" ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param handle_3: handle
declare function PrecacheResource( string_1: string, string_2: string, handle_3: handle )

---[[ PrintLinkedConsoleMessage  Print a console message with a linked console command ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
declare function PrintLinkedConsoleMessage( string_1: string, string_2: string )

---[[ RandomFloat  Get a random float within a range ]]
-- @return float
-- @param float_1: float
-- @param float_2: float
declare function RandomFloat( float_1: float, float_2: float ): float

---[[ RandomInt  Get a random int within a range ]]
-- @return int
-- @param int_1: int
-- @param int_2: int
declare function RandomInt( int_1: int, int_2: int ): int

---[[ RegisterSpawnGroupFilterProxy  Create a C proxy for a script-based spawn group filter ]]
-- @return void
-- @param string_1: string
declare function RegisterSpawnGroupFilterProxy( string_1: string )

---[[ ReloadMOTD  Reloads the MotD file ]]
-- @return void
declare function ReloadMOTD(  )

---[[ RemoveSpawnGroupFilterProxy  Remove the C proxy for a script-based spawn group filter ]]
-- @return void
-- @param string_1: string
declare function RemoveSpawnGroupFilterProxy( string_1: string )

---[[ RotateOrientation  Rotate a QAngle by another QAngle. ]]
-- @return QAngle
-- @param QAngle_1: QAngle
-- @param QAngle_2: QAngle
declare function RotateOrientation( QAngle_1: QAngle, QAngle_2: QAngle ): QAngle

---[[ RotatePosition  Rotate a Vector around a point. ]]
-- @return Vector
-- @param Vector_1: Vector
-- @param QAngle_2: QAngle
-- @param Vector_3: Vector
declare function RotatePosition( Vector_1: Vector, QAngle_2: QAngle, Vector_3: Vector ): Vector

---[[ RotateQuaternionByAxisAngle  (quaternion,vector,float) rotates a quaternion by the specified angle around the specified vector axis ]]
-- @return Quaternion
-- @param Quaternion_1: Quaternion
-- @param Vector_2: Vector
-- @param float_3: float
declare function RotateQuaternionByAxisAngle( Quaternion_1: Quaternion, Vector_2: Vector, float_3: float ): Quaternion

---[[ RotationDelta  Find the delta between two QAngles. ]]
-- @return QAngle
-- @param QAngle_1: QAngle
-- @param QAngle_2: QAngle
declare function RotationDelta( QAngle_1: QAngle, QAngle_2: QAngle ): QAngle

---[[ RotationDeltaAsAngularVelocity  converts delta QAngle to an angular velocity Vector ]]
-- @return Vector
-- @param QAngle_1: QAngle
-- @param QAngle_2: QAngle
declare function RotationDeltaAsAngularVelocity( QAngle_1: QAngle, QAngle_2: QAngle ): Vector

---[[ Say  Have Entity say string, and teamOnly or not ]]
-- @return void
-- @param handle_1: handle
-- @param string_2: string
-- @param bool_3: boolean
declare function Say( handle_1: handle, string_2: string, bool_3: boolean )

---[[ ScreenShake  Start a screenshake with the following parameters. vecCenter, flAmplitude, flFrequency, flDuration, flRadius, eCommand( SHAKE_START = 0, SHAKE_STOP = 1 ), bAirShake ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param float_3: float
-- @param float_4: float
-- @param float_5: float
-- @param int_6: int
-- @param bool_7: boolean
declare function ScreenShake( vecCenter: Vector, flAmplitude: float, flFrequency: float, flDuration: float, flRadius: float, eCommand: int, bAirShake: boolean )

---[[ SendToConsole  Send a string to the console as a client command ]]
-- @return void
-- @param string_1: string
declare function SendToConsole( string_1: string )

---[[ SendToServerConsole  Send a string to the console as a server command ]]
-- @return void
-- @param string_1: string
declare function SendToServerConsole( string_1: string )

---[[ SetOpvarFloatAll  Sets an opvar value for all players ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param string_3: string
-- @param float_4: float
declare function SetOpvarFloatAll( string_1: string, string_2: string, string_3: string, float_4: float )

---[[ SetOpvarFloatPlayer  Sets an opvar value for a single player ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param string_3: string
-- @param float_4: float
-- @param handle_5: handle
declare function SetOpvarFloatPlayer( string_1: string, string_2: string, string_3: string, float_4: float, handle_5: handle )

---[[ SetPhysAngularVelocity  Set Angular Velocity for VPHYS or normal object, from a vector of the axis of rotation, multiplied by the degrees of rotation per second. ]]
-- @return void
-- @param handle_1: handle
-- @param Vector_2: Vector
declare function SetPhysAngularVelocity( handle_1: handle, Vector_2: Vector )

---[[ SetQuestName  Set the current quest name. ]]
-- @return void
-- @param string_1: string
declare function SetQuestName( string_1: string )

---[[ SetQuestPhase  Set the current quest phase. ]]
-- @return void
-- @param int_1: int
declare function SetQuestPhase( int_1: int )

---[[ SetRenderingEnabled  Set rendering on/off for an ehandle ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param bool_2: boolean
declare function SetRenderingEnabled( ehandle_1: ehandle, bool_2: boolean )

---[[ ShowMessage  Print a hud message on all clients ]]
-- @return void
-- @param string_1: string
declare function ShowMessage( string_1: string )

---[[ SpawnEntityFromTableAsynchronous  Asynchronously spawns a single entity from a table ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
-- @param handle_3: handle
-- @param handle_4: handle
declare function SpawnEntityFromTableAsynchronous( string_1: string, handle_2: handle, handle_3: handle, handle_4: handle )

---[[ SpawnEntityFromTableSynchronous  Synchronously spawns a single entity from a table ]]
-- @return handle
-- @param string_1: string
-- @param handle_2: handle
declare function SpawnEntityFromTableSynchronous( string_1: string, handle_2: handle ): handle

---[[ SpawnEntityGroupFromTable  Hierarchically spawn an entity group from a set of spawn tables. ]]
-- @return bool
-- @param handle_1: handle
-- @param bool_2: boolean
-- @param handle_3: handle
declare function SpawnEntityGroupFromTable( handle_1: handle, bool_2: boolean, handle_3: handle ): boolean

---[[ SpawnEntityListFromTableAsynchronous  Asynchronously spawn an entity group from a list of spawn tables. A callback will be triggered when the spawning is complete ]]
-- @return int
-- @param handle_1: handle
-- @param handle_2: handle
declare function SpawnEntityListFromTableAsynchronous( handle_1: handle, handle_2: handle ): int

---[[ SpawnEntityListFromTableSynchronous  Synchronously spawn an entity group from a list of spawn tables. ]]
-- @return handle
-- @param handle_1: handle
declare function SpawnEntityListFromTableSynchronous( handle_1: handle )

---[[ SplineQuaternions  (quaternion,quaternion,float) very basic interpolation of v0 to v1 over t on [0,1] ]]
-- @return Quaternion
-- @param Quaternion_1: Quaternion
-- @param Quaternion_2: Quaternion
-- @param float_3: float
declare function SplineQuaternions( Quaternion_1: Quaternion, Quaternion_2: Quaternion, float_3: float )

---[[ SplineVectors  (vector,vector,float) very basic interpolation of v0 to v1 over t on [0,1] ]]
-- @return Vector
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
declare function SplineVectors( Vector_1: Vector, Vector_2: Vector, float_3: float )

---[[ StartSoundEvent  Start a sound event ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function StartSoundEvent( string_1: string, handle_2: handle )

---[[ StartSoundEventFromPosition  Start a sound event from position ]]
-- @return void
-- @param string_1: string
-- @param Vector_2: Vector
declare function StartSoundEventFromPosition( string_1: string, Vector_2: Vector )

---[[ StartSoundEventFromPositionReliable  Start a sound event from position with reliable delivery ]]
-- @return void
-- @param string_1: string
-- @param Vector_2: Vector
declare function StartSoundEventFromPositionReliable( string_1: string, Vector_2: Vector )

---[[ StartSoundEventFromPositionUnreliable  Start a sound event from position with optional delivery ]]
-- @return void
-- @param string_1: string
-- @param Vector_2: Vector
declare function StartSoundEventFromPositionUnreliable( string_1: string, Vector_2: Vector )

---[[ StartSoundEventReliable  Start a sound event with reliable delivery ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function StartSoundEventReliable( string_1: string, handle_2: handle )

---[[ StartSoundEventUnreliable  Start a sound event with optional delivery ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function StartSoundEventUnreliable( string_1: string, handle_2: handle )

---[[ StopEffect  Pass entity and effect name ]]
-- @return void
-- @param handle_1: handle
-- @param string_2: string
declare function StopEffect( handle_1: handle, string_2: string )

---[[ StopListeningToAllGameEvents  Stop listening to all game events within a specific context. ]]
-- @return void
-- @param handle_1: handle
declare function StopListeningToAllGameEvents( handle_1: handle )

---[[ StopListeningToGameEvent  Stop listening to a particular game event. ]]
-- @return bool
-- @param int_1: int
declare function StopListeningToGameEvent( int_1: int )

---[[ StopSoundEvent  Stops a sound event with optional delivery ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function StopSoundEvent( string_1: string, handle_2: handle )

---[[ StopSoundOn  Stop named sound on Entity ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
declare function StopSoundOn( string_1: string, handle_2: handle )

---[[ Time  Get the current server time ]]
-- @return float
declare function Time(  ): float

---[[ TraceCollideable  Pass table - Inputs: start,, ent, (optional mins, maxs) -- outputs: pos, fraction, hit, startsolid, normal ]]
-- @return bool
-- @param handle_1: handle
declare function TraceCollideable( handle_1: handle ): boolean

---[[ TraceHull  Pass table - Inputs: start,, min, max, mask, ignore  -- outputs: pos, fraction, hit, enthit, startsolid ]]
-- @return bool
-- @param handle_1: handle
declare function TraceHull( handle_1: handle ): boolean

---[[ TraceLine  Pass table - Inputs: startpos,pos, mask, ignore  -- outputs: pos, fraction, hit, enthit, startsolid ]]
-- @return bool
-- @param handle_1: handle
declare function TraceLine( info: {
    startpos: Vector,
    endpos: Vector,
    ignore: CBaseEntity?,
    mask: int,
    startsolid: boolean?,
    fraction: float?,
    hit: boolean?,
    enthit: CBaseEntity?,
} ): boolean

---[[ UTIL_MessageText  Sends colored text to one client. ]]
-- @return void
-- @param int_1: int
-- @param string_2: string
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
declare function UTIL_MessageText( int_1: int, string_2: string, int_3: int, int_4: int, int_5: int, int_6: int )

---[[ UTIL_MessageTextAll  Sends colored text to all clients. ]]
-- @return void
-- @param string_1: string
-- @param int_2: int
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
declare function UTIL_MessageTextAll( string_1: string, int_2: int, int_3: int, int_4: int, int_5: int )

---[[ UTIL_MessageTextAll_WithContext  Sends colored text to all clients. (Valid context keys: player_id, value, team_id) ]]
-- @return void
-- @param string_1: string
-- @param int_2: int
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param handle_6: handle
declare function UTIL_MessageTextAll_WithContext( string_1: string, int_2: int, int_3: int, int_4: int, int_5: int, handle_6: handle )

---[[ UTIL_MessageText_WithContext  Sends colored text to one client. (Valid context keys: player_id, value, team_id) ]]
-- @return void
-- @param int_1: int
-- @param string_2: string
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param handle_7: handle
declare function UTIL_MessageText_WithContext( int_1: int, string_2: string, int_3: int, int_4: int, int_5: int, int_6: int, handle_7: handle )

---[[ UTIL_Remove  Removes the specified entity ]]
-- @return void
-- @param handle_1: handle
declare function UTIL_Remove( handle_1: handle )

---[[ UTIL_RemoveImmediate  Immediately removes the specified entity ]]
-- @return void
-- @param handle_1: handle
declare function UTIL_RemoveImmediate( handle_1: handle )

---[[ UTIL_ResetMessageText  Clear all message text on one client. ]]
-- @return void
-- @param int_1: int
declare function UTIL_ResetMessageText( int_1: int )

---[[ UTIL_ResetMessageTextAll  Clear all message text from all clients. ]]
-- @return void
declare function UTIL_ResetMessageTextAll(  )

---[[ UnloadSpawnGroup  Unload a spawn group by name ]]
-- @return void
-- @param string_1: string
declare function UnloadSpawnGroup( string_1: string )

---[[ UnloadSpawnGroupByHandle  Unload a spawn group by handle ]]
-- @return void
-- @param int_1: int
declare function UnloadSpawnGroupByHandle( int_1: int )

---[[ VectorToAngles  Get Qangles (with no roll) for a Vector. ]]
-- @return QAngle
-- @param Vector_1: Vector
declare function VectorToAngles( Vector_1: Vector )

---[[ Warning  Print a warning ]]
-- @return void
-- @param string_1: string
declare function Warning( string_1: string )

---[[ cvar_getf  Gets the value of the given cvar, as a float. ]]
-- @return float
-- @param string_1: string
declare function cvar_getf( string_1: string ): float

---[[ cvar_setf  Sets the value of the given cvar, as a float. ]]
-- @return bool
-- @param string_1: string
-- @param float_2: float
declare function cvar_setf( string_1: string, float_2: float ): boolean

---[[ rr_AddDecisionRule  Add a rule to the decision database. ]]
-- @return bool
-- @param handle_1: handle
declare function rr_AddDecisionRule( handle_1: handle ): boolean

---[[ rr_CommitAIResponse  Commit the result of QueryBestResponse back to the given entity to play. Call with params (entity, airesponse) ]]
-- @return bool
-- @param handle_1: handle
-- @param handle_2: handle
declare function rr_CommitAIResponse( handle_1: handle, handle_2: handle ): boolean

---[[ rr_GetResponseTargets  Retrieve a table of all available expresser targets, in the form { name : handle, name: handle }. ]]
-- @return handle
declare function rr_GetResponseTargets(  ): table

---[[ rr_QueryBestResponse  Params: (entity, query) : tests 'query' against entity's response system and returns the best response found (or null if none found). ]]
-- @return bool
-- @param handle_1: handle
-- @param handle_2: handle
-- @param handle_3: handle
declare function rr_QueryBestResponse( handle_1: handle, handle_2: handle, handle_3: handle ): boolean

declare class CBaseEntity
---[[ CBaseEntity:AddEffects  AddEffects( int ): Adds the render effect flag. ]]
-- @return void
-- @param nFlags int
    function AddEffects( self, nFlags: int )

---[[ CBaseEntity:ApplyAbsVelocityImpulse  Apply a Velocity Impulse ]]
-- @return void
-- @param vecImpulse Vector
    function ApplyAbsVelocityImpulse( self, vecImpulse: Vector )

---[[ CBaseEntity:ApplyLocalAngularVelocityImpulse  Apply an Ang Velocity Impulse ]]
-- @return void
-- @param angImpulse Vector
    function ApplyLocalAngularVelocityImpulse( self, angImpulse: Vector )

---[[ CBaseEntity:Attribute_GetFloatValue  Get float value for an entity attribute. ]]
-- @return float
-- @param pName string
-- @param flDefault float
    function Attribute_GetFloatValue( self, pName: string, flDefault: float ): float

---[[ CBaseEntity:Attribute_GetIntValue  Get int value for an entity attribute. ]]
-- @return int
-- @param pName string
-- @param nDefault int
    function Attribute_GetIntValue( self, pName: string, nDefault: int ): int

---[[ CBaseEntity:Attribute_SetFloatValue  Set float value for an entity attribute. ]]
-- @return void
-- @param pName string
-- @param flValue float
    function Attribute_SetFloatValue( self, pName: string, flValue: float ): float

---[[ CBaseEntity:Attribute_SetIntValue  Set int value for an entity attribute. ]]
-- @return void
-- @param pName string
-- @param nValue int
    function Attribute_SetIntValue( self, pName: string, nValue: int )

---[[ CBaseEntity:DeleteAttribute  Delete an entity attribute. ]]
-- @return void
-- @param pName string
    function DeleteAttribute( self, pName: string )

---[[ CBaseEntity:EmitSound  Plays a sound from this entity. ]]
-- @return void
-- @param soundname string
    function EmitSound( self, soundname: string )

---[[ CBaseEntity:EmitSoundParams  Plays/modifies a sound from this entity. changes sound if nPitch and/or flVol or flSoundTime is > 0. ]]
-- @return void
-- @param soundname string
-- @param nPitch int
-- @param flVolume float
-- @param flDelay float
    function EmitSoundParams( self, soundname: string, nPitch: int, flVolume: float, flDelay: float )

---[[ CBaseEntity:EyeAngles  Get the qangles that this entity is looking at. ]]
-- @return QAngle
    function EyeAngles( self ): QAngle

---[[ CBaseEntity:EyePosition  Get vector to eye position - absolute coords. ]]
-- @return Vector
    function EyePosition( self ): Vector

---[[ CBaseEntity:FirstMoveChild   ]]
-- @return handle
    function FirstMoveChild( self ): handle

---[[ CBaseEntity:FollowEntity  hEntity to follow, bool bBoneMerge ]]
-- @return void
-- @param hEnt handle
-- @param bBoneMerge bool
    function FollowEntity( self, hEnt: CBaseEntity, bBoneMerge: boolean? )

---[[ CBaseEntity:GatherCriteria  Returns a table containing the criteria that would be used for response queries on this entity. This is the same as the table that is passed to response rule script function callbacks. ]]
-- @return void
-- @param hResult handle
    function GatherCriteria( self, hResult: table )

---[[ CBaseEntity:GetAbsOrigin   ]]
-- @return Vector
    function GetAbsOrigin( self ): Vector

---[[ CBaseEntity:GetAbsScale   ]]
-- @return float
    function GetAbsScale( self ): float

---[[ CBaseEntity:GetAngles   ]]
-- @return QAngle
    function GetAngles( self ): QAngle

---[[ CBaseEntity:GetAnglesAsVector  Get entity pitch, yaw, roll as a vector. ]]
-- @return Vector
    function GetAnglesAsVector( self ): Vector

---[[ CBaseEntity:GetAngularVelocity  Get the local angular velocity - returns a vector of pitch,yaw,roll ]]
-- @return Vector
    function GetAngularVelocity( self ): Vector

---[[ CBaseEntity:GetBaseVelocity  Get Base? velocity. ]]
-- @return Vector
    function GetBaseVelocity( self ): Vector

---[[ CBaseEntity:GetBoundingMaxs  Get a vector containing max bounds, centered on object. ]]
-- @return Vector
    function GetBoundingMaxs( self ): Vector

---[[ CBaseEntity:GetBoundingMins  Get a vector containing min bounds, centered on object. ]]
-- @return Vector
    function GetBoundingMins( self ): Vector

---[[ CBaseEntity:GetBounds  Get a table containing the 'Mins' & 'Maxs' vector bounds, centered on object. ]]
-- @return table
    function GetBounds( self ): { Mins: Vector, Maxs: Vector }

---[[ CBaseEntity:GetCenter  Get vector to center of object - absolute coords ]]
-- @return Vector
    function GetCenter( self ): Vector

---[[ CBaseEntity:GetChildren  Get the entities parented to this entity. ]]
-- @return handle
    function GetChildren( self ): { CBaseEntity }

---[[ CBaseEntity:GetContext  GetContext( name ): looks up a context and returns it if available. May return string, float, or null (if the context isn't found). ]]
-- @return table
-- @param name string
    function GetContext( self, name: string ): any

---[[ CBaseEntity:GetForwardVector  Get the forward vector of the entity. ]]
-- @return Vector
    function GetForwardVector( self ): Vector

---[[ CBaseEntity:GetHealth  Get the health of this entity. ]]
-- @return int
    function GetHealth( self ): number

---[[ CBaseEntity:GetLocalAngles  Get entity local pitch, yaw, roll as a QAngle ]]
-- @return QAngle
    function GetLocalAngles( self ): QAngle

---[[ CBaseEntity:GetLocalAngularVelocity  Maybe local angvel ]]
-- @return QAngle
    function GetLocalAngularVelocity( self ): QAngle

---[[ CBaseEntity:GetLocalOrigin  Get entity local origin as a Vector ]]
-- @return Vector
    function GetLocalOrigin( self ): Vector

---[[ CBaseEntity:GetLocalScale   ]]
-- @return float
    function GetLocalScale( self ): float

---[[ CBaseEntity:GetLocalVelocity  Get Entity relative velocity. ]]
-- @return Vector
    function GetLocalVelocity( self ): Vector

---[[ CBaseEntity:GetMass  Get the mass of an entity. (returns 0 if it doesn't have a physics object) ]]
-- @return float
    function GetMass( self ): float

---[[ CBaseEntity:GetMaxHealth  Get the maximum health of this entity. ]]
-- @return int
    function GetMaxHealth( self ): int

---[[ CBaseEntity:GetModelName  Returns the name of the model. ]]
-- @return string
    function GetModelName( self ): string

---[[ CBaseEntity:GetMoveParent  If in hierarchy, retrieves the entity's parent. ]]
-- @return handle
    function GetMoveParent( self ): CBaseEntity?

---[[ CBaseEntity:GetOrigin   ]]
-- @return Vector
    function GetOrigin( self ): Vector

---[[ CBaseEntity:GetOwner  Gets this entity's owner ]]
-- @return handle
    function GetOwner( self ): int?

---[[ CBaseEntity:GetOwnerEntity  Get the owner entity, if there is one ]]
-- @return handle
    function GetOwnerEntity( self ): CBaseEntity?

---[[ CBaseEntity:GetRightVector  Get the right vector of the entity. ]]
-- @return Vector
    function GetRightVector( self ): Vector

---[[ CBaseEntity:GetRootMoveParent  If in hierarchy, walks up the hierarchy to find the root parent. ]]
-- @return handle
    function GetRootMoveParent( self ): CBaseEntity?

---[[ CBaseEntity:GetSoundDuration  Returns float duration of the sound. Takes soundname and optional actormodelname. ]]
-- @return float
-- @param soundname string
-- @param actormodel string
    function GetSoundDuration( self, soundname: string, actormodel: string? ): float

---[[ CBaseEntity:GetSpawnGroupHandle  Returns the spawn group handle of this entity ]]
-- @return int
    function GetSpawnGroupHandle( self ): int

---[[ CBaseEntity:GetTeam  Get the team number of this entity. ]]
-- @return int
    function GetTeam( self ): int

---[[ CBaseEntity:GetTeamNumber  Get the team number of this entity. ]]
-- @return int
    function GetTeamNumber( self ): int

---[[ CBaseEntity:GetUpVector  Get the up vector of the entity. ]]
-- @return Vector
    function GetUpVector( self ): Vector

---[[ CBaseEntity:GetVelocity   ]]
-- @return Vector
    function GetVelocity( self ): Vector

---[[ CBaseEntity:HasAttribute  See if an entity has a particular attribute. ]]
-- @return bool
-- @param pName string
    function HasAttribute( self, pName: string ): boolean

---[[ CBaseEntity:IsAlive  Is this entity alive? ]]
-- @return bool
    function IsAlive( self ): boolean

---[[ CBaseEntity:IsNPC  Is this entity an CAI_BaseNPC? ]]
-- @return bool
    function IsNPC( self ): boolean

---[[ CBaseEntity:IsPlayer  Is this entity a player? ]]
-- @return bool
    function IsPlayer( self ): boolean

---[[ CBaseEntity:Kill   ]]
-- @return void
    function Kill( self )

---[[ CBaseEntity:NextMovePeer   ]]
-- @return handle
    function NextMovePeer( self ): CBaseEntity?

---[[ CBaseEntity:OverrideFriction  Takes duration, value for a temporary override. ]]
-- @return void
-- @param duration float
-- @param friction float
    function OverrideFriction( self, duration: float, friction: float )

---[[ CBaseEntity:PrecacheScriptSound  Precache a sound for later playing. ]]
-- @return void
-- @param soundname string
    function PrecacheScriptSound( self, soundname: string )

---[[ CBaseEntity:RemoveEffects  RemoveEffects( int ): Removes the render effect flag. ]]
-- @return void
-- @param nFlags int
    function RemoveEffects( self, nFlags: int )

---[[ CBaseEntity:SetAbsAngles  Set entity pitch, yaw, roll by component. ]]
-- @return void
-- @param fPitch float
-- @param fYaw float
-- @param fRoll float
    function SetAbsAngles( self, fPitch: float, fYaw: float, fRoll: float )

---[[ CBaseEntity:SetAbsOrigin   ]]
-- @return void
-- @param origin Vector
    function SetAbsOrigin( self, origin: Vector )

---[[ CBaseEntity:SetAbsScale   ]]
-- @return void
-- @param flScale float
    function SetAbsScale( self, flScale: float )

---[[ CBaseEntity:SetAngles  Set entity pitch, yaw, roll by component. ]]
-- @return void
-- @param fPitch float
-- @param fYaw float
-- @param fRoll float
    function SetAngles( self, fPitch: float, fYaw: float, fRoll: float )

---[[ CBaseEntity:SetAngularVelocity  Set the local angular velocity - takes float pitch,yaw,roll velocities ]]
-- @return void
-- @param pitchVel float
-- @param yawVel float
-- @param rollVel float
    function SetAngularVelocity( self, pitchVel: float, yawVel: float, rollVel: float )

---[[ CBaseEntity:SetConstraint  Set the position of the constraint. ]]
-- @return void
-- @param vPos Vector
    function SetConstraint( self, vPos: Vector )

---[[ CBaseEntity:SetContext  SetContext( name , value, duration ): store any key/value pair in this entity's dialog contexts. Value must be a string. Will last for duration (set 0 to mean 'forever'). ]]
-- @return void
-- @param pName string
-- @param pValue string
-- @param duration float
    function SetContext( self, pName: string, pValue: string, duration: float )

---[[ CBaseEntity:SetContextNum  SetContextNum( name , value, duration ): store any key/value pair in this entity's dialog contexts. Value must be a number (int or float). Will last for duration (set 0 to mean 'forever'). ]]
-- @return void
-- @param pName string
-- @param fValue float
-- @param duration float
    function SetContextNum( self, pName: string, fValue: float, duration: float )

---[[ CBaseEntity:SetContextThink  Set a think function on this entity. ]]
-- @return void
-- @param pszContextName string
-- @param hThinkFunc handle
-- @param flInterval float
    function SetContextThink( self, pszContextName: string, hThinkFunc: (...any) -> ...any, flInterval: float )

---[[ CBaseEntity:SetEntityName  Set the name of an entity. ]]
-- @return void
-- @param pName string
    function SetEntityName( self, pName: string )

---[[ CBaseEntity:SetForwardVector  Set the orientation of the entity to have this forward vector. ]]
-- @return void
-- @param v Vector
    function SetForwardVector( self, v: Vector )

---[[ CBaseEntity:SetFriction  Set PLAYER friction, ignored for objects. ]]
-- @return void
-- @param flFriction float
    function SetFriction( self, flFriction: float )

---[[ CBaseEntity:SetGravity  Set PLAYER gravity, ignored for objects. ]]
-- @return void
-- @param flGravity float
    function SetGravity( self, flGravity: float )

---[[ CBaseEntity:SetHealth  Set the health of this entity. ]]
-- @return void
-- @param nHealth int
    function SetHealth( self, nHealth: int )

---[[ CBaseEntity:SetLocalAngles  Set entity local pitch, yaw, roll by component ]]
-- @return void
-- @param fPitch float
-- @param fYaw float
-- @param fRoll float
    function SetLocalAngles( self, fPitch: float, fYaw: float, fRoll: float )

---[[ CBaseEntity:SetLocalOrigin  Set entity local origin from a Vector ]]
-- @return void
-- @param origin Vector
    function SetLocalOrigin( self, origin: Vector )

---[[ CBaseEntity:SetLocalScale   ]]
-- @return void
-- @param flScale float
    function SetLocalScale( self, flScale: float )

---[[ CBaseEntity:SetMass  Set the mass of an entity. (does nothing if it doesn't have a physics object) ]]
-- @return void
-- @param flMass float
    function SetMass( self, flMass: float )

---[[ CBaseEntity:SetMaxHealth  Set the maximum health of this entity. ]]
-- @return void
-- @param amt int
    function SetMaxHealth( self, amt: int )

---[[ CBaseEntity:SetOrigin   ]]
-- @return void
-- @param v Vector
    function SetOrigin( self, v: Vector )

---[[ CBaseEntity:SetOwner  Sets this entity's owner ]]
-- @return void
-- @param pOwner handle
    function SetOwner( self, pOwner: CBaseEntity? )

---[[ CBaseEntity:SetParent  Set the parent for this entity. ]]
-- @return void
-- @param hParent handle
-- @param pAttachmentname string
    function SetParent( self, hParent: CBaseEntity?, pAttachmentname: string? )

---[[ CBaseEntity:SetTeam   ]]
-- @return void
-- @param iTeamNum int
    function SetTeam( self, iTeamNum: int )

---[[ CBaseEntity:SetThink ]]
-- @return void
-- @param thinkFunction function
-- @param thinkName string
-- @param initialDelay float
    function SetThink( self, thinkFunction: () -> number?, thinkName: string, initialDelay: float )

---[[ CBaseEntity:SetVelocity   ]]
-- @return void
-- @param vecVelocity Vector
    function SetVelocity( self, vecVelocity: Vector )

---[[ CBaseEntity:StopSound  Stops a named sound playing from this entity. ]]
-- @return void
-- @param soundname string
    function StopSound( self, soundname: string )

---[[ CBaseEntity:TakeDamage  Apply damage to this entity. Use CreateDamageInfo() to create a damageinfo object. ]]
-- @return int
-- @param hInfo handle
    function TakeDamage( self, hInfo: handle ): int

---[[ CBaseEntity:TransformPointEntityToWorld  Returns the input Vector transformed from entity to world space ]]
-- @return Vector
-- @param vPoint Vector
    function TransformPointEntityToWorld( self, vPoint: Vector )

---[[ CBaseEntity:TransformPointWorldToEntity  Returns the input Vector transformed from world to entity space ]]
-- @return Vector
-- @param vPoint Vector
    function TransformPointWorldToEntity( self, vPoint: Vector )

---[[ CBaseEntity:Trigger  Fires off this entity's OnTrigger responses. ]]
-- @return void
    function Trigger( self )

---[[ CBaseEntity:ValidatePrivateScriptScope  Validates the private script scope and creates it if one doesn't exist. ]]
-- @return void
    function ValidatePrivateScriptScope( self )
end

declare class CAI_BaseNPC extends CBaseEntity
    ---[[ CAI_BaseNPC:GetSquad  Get the squad to which this npc belongs. ]]
    -- @return handle
    function GetSquad(self): handle

    ---[[ CAI_BaseNPC:NpcForceGoPosition  Set a position goal and start moving. ]]
    -- @return void
    -- @param vPos Vector
    -- @param bRun bool
    -- @param flSuccessTolerance float
    function NpcForceGoPosition( self, vPos: Vector, bRun: boolean, flSuccessTolerance: float )

    ---[[ CAI_BaseNPC:NpcNavClearGoal  Removes the NPC's current goal. ]]
    -- @return void
    function NpcNavClearGoal( self )

    ---[[ CAI_BaseNPC:NpcNavGetGoalPosition  Get the position of the current goal. ]]
    -- @return Vector
    function NpcNavGetGoalPosition( self ): Vector

    ---[[ CAI_BaseNPC:NpcNavGoalActive  Returns true if NPC has a goal and path ]]
    -- @return bool
    function NpcNavGoalActive( self ): boolean
end

declare class CBaseAnimating extends CBaseEntity
---[[ CBaseAnimating:ActiveSequenceDuration  Returns the duration in seconds of the active sequence. ]]
-- @return float
    function ActiveSequenceDuration( self ): float

---[[ CBaseAnimating:GetAttachmentAngles  Get the attachment id's angles as a p,y,r vector. ]]
-- @return Vector
-- @param iAttachment int
    function GetAttachmentAngles( self, iAttachment: int ): Vector

---[[ CBaseAnimating:GetAttachmentForward  Get the attachment id's forward vector. ]]
-- @return Vector
-- @param iAttachment int
    function GetAttachmentForward( self, iAttachment: int ): Vector

---[[ CBaseAnimating:GetAttachmentOrigin  Get the attachment id's origin vector. ]]
-- @return Vector
-- @param iAttachment int
    function GetAttachmentOrigin( self, iAttachment: int ): Vector

---[[ CBaseAnimating:GetCycle  Get the cycle of the animation. ]]
-- @return float
    function GetCycle( self ): float

---[[ CBaseAnimating:GetGraphParameter  Get the value of the given animGraph parameter ]]
-- @return table
-- @param pszParam string
    function GetGraphParameter( self, pszParam: string ): table

---[[ CBaseAnimating:GetModelScale  Get scale of entity's model. ]]
-- @return float
    function GetModelScale( self ): float

---[[ CBaseAnimating:GetSequence  Returns the name of the active sequence. ]]
-- @return string
    function GetSequence( self ): string

---[[ CBaseAnimating:IsSequenceFinished  Ask whether the main sequence is done playing. ]]
-- @return bool
    function IsSequenceFinished( self ): boolean

---[[ CBaseAnimating:RegisterAnimTagListener  Registers a listener for string AnimTags, replaces existing script listener if any ]]
-- @return void
-- @param hAnimTagListenerFunc handle
    function RegisterAnimTagListener( self, hAnimTagListenerFunc: any ) -- FIXME!!

---[[ CBaseAnimating:ResetSequence  Sets the active sequence by name, resetting the current cycle. ]]
-- @return void
-- @param pSequenceName string
    function ResetSequence( self, pSequenceName: string )

---[[ CBaseAnimating:ScriptLookupAttachment  Get the named attachment id. ]]
-- @return int
-- @param pAttachmentName string
    function ScriptLookupAttachment( self, pAttachmentName: string )

---[[ CBaseAnimating:SequenceDuration  Returns the duration in seconds of the given sequence name. ]]
-- @return float
-- @param pSequenceName string
    function SequenceDuration( self, pSequenceName: string ): float

---[[ CBaseAnimating:SetGraphLookTarget  Pass the desired look target in world space to the graph ]]
-- @return void
-- @param vValue Vector
    function SetGraphLookTarget( self, vValue: Vector )

---[[ CBaseAnimating:SetGraphParameter  Set the specific param value, type is inferred from the type in script ]]
-- @return void
-- @param pszParam string
-- @param svArg table
    function SetGraphParameter( self, pszParam: string, svArg: any )

---[[ CBaseAnimating:SetGraphParameterBool  Set the specific param on or off ]]
-- @return void
-- @param szName string
-- @param bValue bool
    function SetGraphParameterBool( self, szName: string, bValue: boolean )

---[[ CBaseAnimating:SetGraphParameterEnum  Pass the enum (int) value to the specified param ]]
-- @return void
-- @param szName string
-- @param nValue int
    function SetGraphParameterEnum( self, szName: string, nValue: int )

---[[ CBaseAnimating:SetGraphParameterFloat  Pass the float value to the specified param ]]
-- @return void
-- @param szName string
-- @param flValue float
    function SetGraphParameterFloat( self, szName: string, flValue: float )

---[[ CBaseAnimating:SetGraphParameterInt  Pass the int value to the specified param ]]
-- @return void
-- @param szName string
-- @param nValue int
    function SetGraphParameterInt( self, szName: string, nValue: int )

---[[ CBaseAnimating:SetGraphParameterVector  Pass the vector value to the specified param in the graph ]]
-- @return void
-- @param szName string
-- @param vValue Vector
    function SetGraphParameterVector( self, szName: string, vValue: Vector )

---[[ CBaseAnimating:SetModelScale  Set scale of entity's model. ]]
-- @return void
-- @param flScale float
    function SetModelScale( self, flScale: float )

---[[ CBaseAnimating:SetPoseParameter  Set the specified pose parameter to the specified value. ]]
-- @return float
-- @param szName string
-- @param fValue float
    function SetPoseParameter( self, szName: string, fValue: float ): float

---[[ CBaseAnimating:SetSequence  Sets the active sequence by name, keeping the current cycle. ]]
-- @return void
-- @param pSequenceName string
    function SetSequence( self, pSequenceName: string )

---[[ CBaseAnimating:StopAnimation  Stop the current animation by setting playback rate to 0.0. ]]
-- @return void
    function StopAnimation( self )

---[[ CBaseAnimating:UnregisterAnimTagListener  Unregisters the current string AnimTag listener, if any ]]
-- @return void
-- @param hScript table
    function UnregisterAnimTagListener( self, hScript: table )
end

declare class CBaseCombatCharacter extends CBaseEntity
---[[ CBaseCombatCharacter:GetEquippedWeapons  GetEquippedWeapons() : Returns an array of all the equipped weapons ]]
-- @return table
    function GetEquippedWeapons( self ): table

---[[ CBaseCombatCharacter:GetFaction  Get the combat character faction. ]]
-- @return int
    function GetFaction( self ): int

---[[ CBaseCombatCharacter:GetWeaponCount  GetWeaponCount() : Gets the number of weapons currently equipped ]]
-- @return int
    function GetWeaponCount( self ): int

---[[ CBaseCombatCharacter:ShootPosition  Returns the shoot position eyes (or hand in VR). ]]
-- @return Vector
-- @param nHand int
-- @param nMuzzle int
    function ShootPosition( self, nHand: int, nMuzzle: int ): Vector
end

declare class CBaseFlex extends CBaseAnimating
---[[ CBaseFlex:FindFlexController  Finds a flex controller by name, returns the index, -1 if not found ]]
-- @return int
-- @param pszFlexControllerName string
    function FindFlexController( self, pszFlexControllerName: string ): int

---[[ CBaseFlex:GetCurrentScene  Returns the instance of the oldest active scene entity (if any). ]]
-- @return handle
    function GetCurrentScene( self ): handle

---[[ CBaseFlex:GetFlexWeight  Gets the weight of a flex controller specified by index, use FindFlexController to get the index of a flex controller by name ]]
-- @return float
-- @param nFlexControllerIndex int
    function GetFlexWeight( self, nFlexControllerIndex: int ): float

---[[ CBaseFlex:GetSceneByIndex  Returns the instance of the scene entity at the specified index. ]]
-- @return handle
-- @param index int
    function GetSceneByIndex( self, index: int ): handle

---[[ CBaseFlex:ScriptPlayScene  ( vcd file, delay ) - play specified vcd file ]]
-- @return float
-- @param pszScene string
-- @param flDelay float
    function ScriptPlayScene( self, pszScene: string, flDelay: float )

---[[ CBaseFlex:SetFlexWeight  Sets the weight of a flex controller specified by index, use FindFlexController to get the index of a flex controller by name ]]
-- @return void
-- @param nFlexControllerIndex int
-- @param flWeight float
    function SetFlexWeight( self, nFlexControllerIndex: int, flWeight: float )
end

declare class CBaseModelEntity extends CBaseEntity
---[[ CBaseModelEntity:GetMaterialGroupHash  GetMaterialGroupHash(): Get the material group hash of this entity. ]]
-- @return unsigned
    function GetMaterialGroupHash( self ): number

---[[ CBaseModelEntity:GetMaterialGroupMask  GetMaterialGroupMask(): Get the mesh group mask of this entity. ]]
-- @return uint64
    function GetMaterialGroupMask( self ): number

---[[ CBaseModelEntity:GetRenderAlpha  GetRenderAlpha(): Get the alpha modulation of this entity. ]]
-- @return int
    function GetRenderAlpha( self ): int

---[[ CBaseModelEntity:GetRenderColor  GetRenderColor(): Get the render color of the entity. ]]
-- @return Vector
    function GetRenderColor( self ): Vector

---[[ CBaseModelEntity:SetBodygroup  Sets a bodygroup. ]]
-- @return void
-- @param iGroup int
-- @param iValue int
    function SetBodygroup( self, iGroup: int, iValue: int )

---[[ CBaseModelEntity:SetBodygroupByName  Sets a bodygroup by name. ]]
-- @return void
-- @param pName string
-- @param iValue int
    function SetBodygroupByName( self, pName: string, iValue: int )

---[[ CBaseModelEntity:SetLightGroup  SetLightGroup( string ): Sets the light group of the entity. ]]
-- @return void
-- @param pLightGroup string
    function SetLightGroup( self, pLightGroup: string )

---[[ CBaseModelEntity:SetMaterialGroup  SetMaterialGroup( string ): Set the material group of this entity. ]]
-- @return void
-- @param pMaterialGroup string
    function SetMaterialGroup( self, pMaterialGroup: string )

---[[ CBaseModelEntity:SetMaterialGroupHash  SetMaterialGroupHash( uint32 ): Set the material group hash of this entity. ]]
-- @return void
-- @param nHash unsigned
    function SetMaterialGroupHash( self, nHash: number )

---[[ CBaseModelEntity:SetMaterialGroupMask  SetMaterialGroupMask( uint64 ): Set the mesh group mask of this entity. ]]
-- @return void
-- @param nMeshGroupMask uint64
    function SetMaterialGroupMask( self, nMeshGroupMask: number )

---[[ CBaseModelEntity:SetModel   ]]
-- @return void
-- @param pModelName string
    function SetModel( self, pModelName: string )

---[[ CBaseModelEntity:SetRenderAlpha  SetRenderAlpha( int ): Set the alpha modulation of this entity. ]]
-- @return void
-- @param nAlpha int
    function SetRenderAlpha( self, nAlpha: int )

---[[ CBaseModelEntity:SetRenderColor  SetRenderColor( r, g, b ): Sets the render color of the entity. ]]
-- @return void
-- @param r int
-- @param g int
-- @param b int
    function SetRenderColor( self, r: int, g: int, b: int )

---[[ CBaseModelEntity:SetRenderMode  SetRenderMode( int ): Sets the render mode of the entity. ]]
-- @return void
-- @param nMode int
    function SetRenderMode( self, nMode: int )

---[[ CBaseModelEntity:SetSingleMeshGroup  SetSingleMeshGroup( string ): Set a single mesh group for this entity. ]]
-- @return void
-- @param pMeshGroupName string
    function SetSingleMeshGroup( self, pMeshGroupName: string )

---[[ CBaseModelEntity:SetSize   ]]
-- @return void
-- @param mins Vector
-- @param maxs Vector
    function SetSize( self, mins: Vector, maxs: Vector )

---[[ CBaseModelEntity:SetSkin  Set skin (int). ]]
-- @return void
-- @param iSkin int
    function SetSkin( self, iSkin: int )
end

declare class CBasePlayer extends CBaseCombatCharacter
---[[ CBasePlayer:AreChaperoneBoundsVisible  Returns whether this player's chaperone bounds are visible. ]]
-- @return bool
    function AreChaperoneBoundsVisible( self ): boolean

---[[ CBasePlayer:GetAnalogActionPositionForHand  Returns the value of the analog action for the given hand. ]]
-- @return Vector
-- @param nLiteralHandType int
-- @param nAnalogAction int
    function GetAnalogActionPositionForHand( self, nLiteralHandType: int, nAnalogAction: int ): Vector

---[[ CBasePlayer:GetHMDAnchor  Returns the HMD anchor entity for this player if it exists. ]]
-- @return handle
    function GetHMDAnchor( self ): handle

---[[ CBasePlayer:GetHMDAvatar  Returns the HMD Avatar entity for this player if it exists. ]]
-- @return handle
    function GetHMDAvatar( self ): handle

---[[ CBasePlayer:GetPlayArea  Returns the Vector position of the point you ask for. Pass 0-3 to get the four points. ]]
-- @return Vector
-- @param nPoint
    function GetPlayArea( self, nPoint: int ): Vector

---[[ CBasePlayer:GetUserID  Returns the player's user id. ]]
-- @return int
    function GetUserID( self ): int

---[[ CBasePlayer:GetVRControllerType  Returns the type of controller being used while in VR. ]]
-- @return <unknown>
    function GetVRControllerType( self ): any

---[[ CBasePlayer:IsDigitalActionOnForHand  Returns true if the digital action is on for the given hand. ]]
-- @return bool
-- @param nLiteralHandType int
-- @param nDigitalAction int
    function IsDigitalActionOnForHand( self, nLiteralHandType: int, nDigitalAction: int ): boolean

---[[ CBasePlayer:IsNoclipping  Returns true if the player is in noclip mode. ]]
-- @return bool
    function IsNoclipping( self ): boolean

---[[ CBasePlayer:IsUsePressed  Returns true if the use key is pressed. ]]
-- @return bool
    function IsUsePressed( self ): boolean

---[[ CBasePlayer:IsVRControllerButtonPressed  Returns true if the controller button is pressed. ]]
-- @return bool
-- @param nButton int
    function IsVRControllerButtonPressed( self, nButton: int ): boolean

---[[ CBasePlayer:IsVRDashboardShowing  Returns true if the SteamVR dashboard is showing for this player. ]]
-- @return bool
    function IsVRDashboardShowing( self ): boolean
end

declare class CBaseTrigger extends CBaseEntity
---[[ CBaseTrigger:Disable  Disable's the trigger ]]
-- @return void
    function Disable( self )

---[[ CBaseTrigger:Enable  Enable the trigger ]]
-- @return void
    function Enable( self )

---[[ CBaseTrigger:IsTouching  Checks whether the passed entity is touching the trigger. ]]
-- @return bool
-- @param hEnt handle
    function IsTouching( self, hEnt: CBaseEntity?): boolean
end

declare class CBodyComponent extends CBaseAnimating
---[[ CBodyComponent:AddImpulseAtPosition  Apply an impulse at a worldspace position to the physics ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
    function AddImpulseAtPosition( self, Vector_1: Vector, Vector_2: Vector )

---[[ CBodyComponent:AddVelocity  Add linear and angular velocity to the physics object ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
    function AddVelocity( self, Vector_1: Vector, Vector_2: Vector )

---[[ CBodyComponent:DetachFromParent  Detach from its parent ]]
-- @return void
    function DetachFromParent( self )

---[[ CBodyComponent:GetSequence  Returns the active sequence ]]
-- @return <unknown>
    function GetSequence( self ): any

---[[ CBodyComponent:IsAttachedToParent  Is attached to parent ]]
-- @return bool
    function IsAttachedToParent( self ): boolean

---[[ CBodyComponent:LookupSequence  Returns a sequence id given a name ]]
-- @return <unknown>
-- @param string_1: string
    function LookupSequence( self, string_1: string ): any

---[[ CBodyComponent:SequenceDuration  Returns the duration in seconds of the specified sequence ]]
-- @return float
-- @param string_1: string
    function SequenceDuration( self, string_1: string ): float

---[[ CBodyComponent:SetAngularVelocity   ]]
-- @return void
-- @param Vector_1: Vector
    function SetAngularVelocity( self, Vector_1: Vector )

---[[ CBodyComponent:SetAnimation  Pass string for the animation to play on this model ]]
-- @return void
-- @param string_1: string
    function SetAnimation( self, string_1: string )

---[[ CBodyComponent:SetMaterialGroup   ]]
-- @return void
-- @param utlstringtoken_1 utlstringtoken
    function SetMaterialGroup( self, utlstringtoken_1: any ) -- FIXME: what is utlstringtoken?

---[[ CBodyComponent:SetVelocity   ]]
-- @return void
-- @param Vector_1: Vector
    function SetVelocity( self, Vector_1: Vector )
end

declare class CCustomGameEventManager extends CBaseEntity
---[[ CCustomGameEventManager:RegisterListener  ( string EventName, func CallbackFunction ) - Register a callback to be called when a particular custom event arrives. Returns a listener ID that can be used to unregister later. ]]
-- @return int
-- @param string_1: string
-- @param handle_2: handle
    function RegisterListener( self, EventName: string, CallbackFunction: (...any) -> () ): int

---[[ CCustomGameEventManager:Send_ServerToAllClients  ( string EventName, table EventData ) ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
    function Send_ServerToAllClients( self, EventName: string, EventData: table )

---[[ CCustomGameEventManager:Send_ServerToPlayer  ( Entity Player, string EventName, table EventData ) ]]
-- @return void
-- @param handle_1: handle
-- @param string_2: string
-- @param handle_3: handle
    function Send_ServerToPlayer( self, Player: CBasePlayer, EventName: string, EventData: table )

---[[ CCustomGameEventManager:Send_ServerToTeam  ( int TeamNumber, string EventName, table EventData ) ]]
-- @return void
-- @param int_1: int
-- @param string_2: string
-- @param handle_3: handle
    function Send_ServerToTeam( self, TeamNumber: int, EventName: string, EventData: table )

---[[ CCustomGameEventManager:UnregisterListener  ( int ListnerID ) - Unregister a specific listener ]]
-- @return void
-- @param int_1: int
    function UnregisterListener( self, ListenerID: int )
end

declare class CDebugOverlayScriptHelper extends CBaseEntity
---[[ CDebugOverlayScriptHelper:Axis  Draws an axis. Specify origin + orientation in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Quaternion_2: Quaternion
-- @param float_3: float
-- @param bool_4: boolean
-- @param float_5: float
    function Axis( self, Vector_1: Vector, Quaternion_2: Quaternion, float_3: float, bool_4: boolean, float_5: float )

---[[ CDebugOverlayScriptHelper:Box  Draws a world-space axis-aligned box. Specify bounds in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function Box( self, Vector_1: Vector, Vector_2: Vector, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:BoxAngles  Draws an oriented box at the origin. Specify bounds in local space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param Quaternion_4: Quaternion
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function BoxAngles( self, Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, Quaternion_4: Quaternion, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )

---[[ CDebugOverlayScriptHelper:Capsule  Draws a capsule. Specify base in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Quaternion_2: Quaternion
-- @param float_3: float
-- @param float_4: float
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function Capsule( self, Vector_1: Vector, Quaternion_2: Quaternion, float_3: float, float_4: float, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )

---[[ CDebugOverlayScriptHelper:Circle  Draws a circle. Specify center in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Quaternion_2: Quaternion
-- @param float_3: float
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function Circle( self, Vector_1: Vector, Quaternion_2: Quaternion, float_3: float, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:CircleScreenOriented  Draws a circle oriented to the screen. Specify center in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function CircleScreenOriented( self, Vector_1: Vector, float_2: float, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:Cone  Draws a wireframe cone. Specifypoint and direction in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param float_4: float
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function Cone( self, Vector_1: Vector, Vector_2: Vector, float_3: float, float_4: float, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )

---[[ CDebugOverlayScriptHelper:Cross  Draws a screen-aligned cross. Specify origin in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function Cross( self, Vector_1: Vector, float_2: float, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:Cross3D  Draws a world-aligned cross. Specify origin in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function Cross3D( self, Vector_1: Vector, float_2: float, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:Cross3DOriented  Draws an oriented cross. Specify origin in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Quaternion_2: Quaternion
-- @param float_3: float
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function Cross3DOriented( self, Vector_1: Vector, Quaternion_2: Quaternion, float_3: float, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:DrawTickMarkedLine  Draws a dashed line. Specifypoints in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function DrawTickMarkedLine( self, Vector_1: Vector, Vector_2: Vector, float_3: float, int_4: int, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )

---[[ CDebugOverlayScriptHelper:EntityAttachments  Draws the attachments of the entity ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param float_2: float
-- @param float_3: float
    function EntityAttachments( self, ehandle_1: ehandle, float_2: float, float_3: float )

---[[ CDebugOverlayScriptHelper:EntityAxis  Draws the axis of the entity origin ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param float_2: float
-- @param bool_3: boolean
-- @param float_4: float
    function EntityAxis( self, ehandle_1: ehandle, float_2: float, bool_3: boolean, float_4: float )

---[[ CDebugOverlayScriptHelper:EntityBounds  Draws bounds of an entity ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param int_2: int
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param bool_6: boolean
-- @param float_7: float
    function EntityBounds( self, ehandle_1: ehandle, int_2: int, int_3: int, int_4: int, int_5: int, bool_6: boolean, float_7: float )

---[[ CDebugOverlayScriptHelper:EntitySkeleton  Draws the skeleton of the entity ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param float_2: float
    function EntitySkeleton( self, ehandle_1: ehandle, float_2: float )

---[[ CDebugOverlayScriptHelper:EntityText  Draws text on an entity ]]
-- @return void
-- @param ehandle_1: ehandle
-- @param int_2: int
-- @param string_3: string
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param float_8: float
    function EntityText( self, ehandle_1: ehandle, int_2: int, string_3: string, int_4: int, int_5: int, int_6: int, int_7: int, float_8: float )

---[[ CDebugOverlayScriptHelper:FilledRect2D  Draws a screen-space filled 2D rectangle. Coordinates are in pixels. ]]
-- @return void
-- @param Vector2D_1: Vector
-- @param Vector2D_2: Vector
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param float_7: float
    function FilledRect2D( self, Vector2D_1: Vector, Vector2D_2: Vector, int_3: int, int_4: int, int_5: int, int_6: int, float_7: float )

---[[ CDebugOverlayScriptHelper:HorzArrow  Draws a horizontal arrow. Specifypoints in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function HorzArrow( self, Vector_1: Vector, Vector_2: Vector, float_3: float, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:Line  Draws a line between two points ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function Line( self, Vector_1: Vector, Vector_2: Vector, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:Line2D  Draws a line between two points in screenspace ]]
-- @return void
-- @param Vector2D_1: Vector
-- @param Vector2D_2: Vector
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param float_7: float
    function Line2D( self, Vector2D_1: Vector, Vector2D_2: Vector, int_3: int, int_4: int, int_5: int, int_6: int, float_7: float )

---[[ CDebugOverlayScriptHelper:PopDebugOverlayScope  Pops the identifier used to group overlays. Overlays marked with this identifier can be deleted in a big batch. ]]
-- @return void
    function PopDebugOverlayScope( self )

---[[ CDebugOverlayScriptHelper:PushAndClearDebugOverlayScope  Pushes an identifier used to group overlays. Deletes all existing overlays using this overlay id. ]]
-- @return void
-- @param utlstringtoken_1 utlstringtoken
    function PushAndClearDebugOverlayScope( self, utlstringtoken_1: any )

---[[ CDebugOverlayScriptHelper:PushDebugOverlayScope  Pushes an identifier used to group overlays. Overlays marked with this identifier can be deleted in a big batch. ]]
-- @return void
-- @param utlstringtoken_1 utlstringtoken
    function PushDebugOverlayScope( self, utlstringtoken_1: any )

---[[ CDebugOverlayScriptHelper:RemoveAllInScope  Removes all overlays marked with a specific identifier, regardless of their lifetime. ]]
-- @return void
-- @param utlstringtoken_1 utlstringtoken
    function RemoveAllInScope( self, utlstringtoken_1: any )

---[[ CDebugOverlayScriptHelper:SolidCone  Draws a solid cone. Specifypoint and direction in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param float_4: float
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function SolidCone( self, Vector_1: Vector, Vector_2: Vector, float_3: float, float_4: float, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )

---[[ CDebugOverlayScriptHelper:Sphere  Draws a wireframe sphere. Specify center in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param int_3: int
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param bool_7: boolean
-- @param float_8: float
    function Sphere( self, Vector_1: Vector, float_2: float, int_3: int, int_4: int, int_5: int, int_6: int, bool_7: boolean, float_8: float )

---[[ CDebugOverlayScriptHelper:SweptBox  Draws a swept box. Specifypoints in world space and the bounds in local space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param Vector_4: Vector
-- @param Quaternion_5: Quaternion
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param int_9: int
-- @param float_10: float
    function SweptBox( self, Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, Vector_4: Vector, Quaternion_5: Quaternion, int_6: int, int_7: int, int_8: int, int_9: int, float_10: float )

---[[ CDebugOverlayScriptHelper:Text  Draws 2D text. Specify origin in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param int_2: int
-- @param string_3: string
-- @param float_4: float
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param float_9: float
    function Text( self, Vector_1: Vector, int_2: int, string_3: string, float_4: float, int_5: int, int_6: int, int_7: int, int_8: int, float_9: float )

---[[ CDebugOverlayScriptHelper:Texture  Draws a screen-space texture. Coordinates are in pixels. ]]
-- @return void
-- @param string_1: string
-- @param Vector2D_2: Vector
-- @param Vector2D_3: Vector
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param Vector2D_8: Vector
-- @param Vector2D_9: Vector
-- @param float_10: float
    function Texture( self, string_1: string, Vector2D_2: Vector, Vector2D_3: Vector, int_4: int, int_5: int, int_6: int, int_7: int, Vector2D_8: Vector, Vector2D_9: Vector, float_10: float )

---[[ CDebugOverlayScriptHelper:Triangle  Draws a filled triangle. Specify vertices in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param Vector_3: Vector
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function Triangle( self, Vector_1: Vector, Vector_2: Vector, Vector_3: Vector, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:UnitTestCycleOverlayRenderType  Toggles the overlay render type, for unit tests ]]
-- @return void
    function UnitTestCycleOverlayRenderType( self )

---[[ CDebugOverlayScriptHelper:VectorText3D  Draws 3D text. Specify origin + orientation in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Quaternion_2: Quaternion
-- @param string_3: string
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function VectorText3D( self, Vector_1: Vector, Quaternion_2: Quaternion, string_3: string, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:VertArrow  Draws a vertical arrow. Specifypoints in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param Vector_2: Vector
-- @param float_3: float
-- @param int_4: int
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param bool_8: boolean
-- @param float_9: float
    function VertArrow( self, Vector_1: Vector, Vector_2: Vector, float_3: float, int_4: int, int_5: int, int_6: int, int_7: int, bool_8: boolean, float_9: float )

---[[ CDebugOverlayScriptHelper:YawArrow  Draws a arrow associated with a specific yaw. Specifypoints in world space. ]]
-- @return void
-- @param Vector_1: Vector
-- @param float_2: float
-- @param float_3: float
-- @param float_4: float
-- @param int_5: int
-- @param int_6: int
-- @param int_7: int
-- @param int_8: int
-- @param bool_9: boolean
-- @param float_10: float
    function YawArrow( self, Vector_1: Vector, float_2: float, float_3: float, float_4: float, int_5: int, int_6: int, int_7: int, int_8: int, bool_9: boolean, float_10: float )
end

declare class CEntities
---[[ CEntities:CreateByClassname  Creates an entity by classname ]]
-- @return handle
-- @param string_1: string
    function CreateByClassname( self, string_1: string ): CEntityInstance?

---[[ CEntities:FindAllByClassname  Finds all entities by class name. Returns an array containing all the found entities. ]]
-- @return table
-- @param string_1: string
    function FindAllByClassname( self, string_1: string ): { CEntityInstance }

---[[ CEntities:FindAllByClassnameWithin  Find entities by class name within a radius. ]]
-- @return table
-- @param string_1: string
-- @param Vector_2: Vector
-- @param float_3: float
    function FindAllByClassnameWithin( self, string_1: string, Vector_2: Vector, float_3: float ): { CEntityInstance }

---[[ CEntities:FindAllByModel  Find entities by model name. ]]
-- @return table
-- @param string_1: string
    function FindAllByModel( self, string_1: string ): { CEntityInstance }

---[[ CEntities:FindAllByName  Find all entities by name. Returns an array containing all the found entities in it. ]]
-- @return table
-- @param string_1: string
    function FindAllByName( self, string_1: string ): { CEntityInstance }

---[[ CEntities:FindAllByNameWithin  Find entities by name within a radius. ]]
-- @return table
-- @param string_1: string
-- @param Vector_2: Vector
-- @param float_3: float
    function FindAllByNameWithin( self, string_1: string, Vector_2: Vector, float_3: float ): { CEntityInstance }

---[[ CEntities:FindAllByTarget  Find entities by targetname. ]]
-- @return table
-- @param string_1: string
    function FindAllByTarget( self, string_1: string ): { CEntityInstance }

---[[ CEntities:FindAllInSphere  Find entities within a radius. ]]
-- @return table
-- @param Vector_1: Vector
-- @param float_2: float
    function FindAllInSphere( self, Vector_1: Vector, float_2: float ): { CEntityInstance }

---[[ CEntities:FindByClassname  Find entities by class name. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
    function FindByClassname( self, handle_1: CEntityInstance?, string_2: string ): CEntityInstance?

---[[ CEntities:FindByClassnameNearest  Find entities by class name nearest to a point. ]]
-- @return handle
-- @param string_1: string
-- @param Vector_2: Vector
-- @param float_3: float
    function FindByClassnameNearest( self, string_1: string, Vector_2: Vector, float_3: float ): CEntityInstance?

---[[ CEntities:FindByClassnameWithin  Find entities by class name within a radius. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
-- @param Vector_3: Vector
-- @param float_4: float
    function FindByClassnameWithin( self, handle_1: CEntityInstance?, string_2: string, Vector_3: Vector, float_4: float ): CEntityInstance?

---[[ CEntities:FindByModel  Find entities by model name. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
    function FindByModel( self, handle_1: CEntityInstance?, string_2: string ): CEntityInstance?

---[[ CEntities:FindByModelWithin  Find entities by model name within a radius. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
-- @param Vector_3: Vector
-- @param float_4: float
    function FindByModelWithin( self, handle_1: CEntityInstance?, string_2: string, Vector_3: Vector, float_4: float ): CEntityInstance?

---[[ CEntities:FindByName  Find entities by name. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
    function FindByName( self, handle_1: CEntityInstance?, string_2: string ): CEntityInstance?

---[[ CEntities:FindByNameNearest  Find entities by name nearest to a point. ]]
-- @return handle
-- @param string_1: string
-- @param Vector_2: Vector
-- @param float_3: float
    function FindByNameNearest( self, string_1: string, Vector_2: Vector, float_3: float ): CEntityInstance?

---[[ CEntities:FindByNameWithin  Find entities by name within a radius. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
-- @param Vector_3: Vector
-- @param float_4: float
    function FindByNameWithin( self, handle_1: CEntityInstance?, string_2: string, Vector_3: Vector, float_4: float ): CEntityInstance?

---[[ CEntities:FindByTarget  Find entities by targetname. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param string_2: string
    function FindByTarget( self, handle_1: CEntityInstance?, string_2: string ): CEntityInstance?

---[[ CEntities:FindInSphere  Find entities within a radius. Pass 'null' to start an iteration, or reference to a previously found entity to continue a search ]]
-- @return handle
-- @param handle_1: handle
-- @param Vector_2: Vector
-- @param float_3: float
    function FindInSphere( self, handle_1: CEntityInstance?, Vector_2: Vector, float_3: float ): CEntityInstance?

---[[ CEntities:First  Begin an iteration over the list of entities ]]
-- @return handle
    function First( self )

---[[ CEntities:GetLocalPlayer  Get the local player. ]]
-- @return handle
    function GetLocalPlayer( self ): CBasePlayer

---[[ CEntities:Next  Continue an iteration over the list of entities, providing reference to a previously found entity ]]
-- @return handle
-- @param handle_1: handle
    function Next( self, handle_1: CEntityInstance? )
end

declare class CEntityInstance extends CBaseAnimating
---[[ CEntityInstance:ConnectOutput  Adds an I/O connection that will call the named function on this entity when the specified output fires. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
    function ConnectOutput( self, string_1: string, string_2: string )

---[[ CEntityInstance:Destroy   ]]
-- @return void
    function Destroy( self )

---[[ CEntityInstance:DisconnectOutput  Removes a connected script function from an I/O event on this entity. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
    function DisconnectOutput( self, string_1: string, string_2: string )

---[[ CEntityInstance:DisconnectRedirectedOutput  Removes a connected script function from an I/O event on the passed entity. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param handle_3: handle
    function DisconnectRedirectedOutput( self, string_1: string, string_2: string, handle_3: CBaseEntity? )

---[[ CEntityInstance:FireOutput  Fire an entity output ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
-- @param handle_3: handle
-- @param table_4 table
-- @param float_5: float
    function FireOutput( self, string_1: string, handle_2: CBaseEntity?, handle_3: CBaseEntity?, table_4: table, float_5: float )

---[[ CEntityInstance:GetClassname   ]]
-- @return string
    function GetClassname( self ): string

---[[ CEntityInstance:GetDebugName  Get the entity name w/help if not defined (i.e. classname/etc) ]]
-- @return string
    function GetDebugName( self ): string

---[[ CEntityInstance:GetEntityHandle  Get the entity as an EHANDLE ]]
-- @return ehandle
    function GetEntityHandle( self ): ehandle

---[[ CEntityInstance:GetEntityIndex   ]]
-- @return int
    function GetEntityIndex( self ): int

---[[ CEntityInstance:GetIntAttr  Get Integer Attribute ]]
-- @return int
-- @param string_1: string
    function GetIntAttr( self, string_1: string ): int

---[[ CEntityInstance:GetName   ]]
-- @return string
    function GetName( self ): string

---[[ CEntityInstance:GetOrCreatePrivateScriptScope  Retrieve, creating if necessary, the private per-instance script-side data associated with an entity ]]
-- @return handle
    function GetOrCreatePrivateScriptScope( self ): any

---[[ CEntityInstance:GetOrCreatePublicScriptScope  Retrieve, creating if necessary, the public script-side data associated with an entity ]]
-- @return handle
    function GetOrCreatePublicScriptScope( self ): any

---[[ CEntityInstance:GetPrivateScriptScope  Retrieve the private per-instance script-side data associated with an entity ]]
-- @return handle
    function GetPrivateScriptScope( self ): any

---[[ CEntityInstance:GetPublicScriptScope  Retrieve the public script-side data associated with an entity ]]
-- @return handle
    function GetPublicScriptScope( self ): any

---[[ CEntityInstance:RedirectOutput  Adds an I/O connection that will call the named function on the passed entity when the specified output fires. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param handle_3: handle
    function RedirectOutput( self, string_1: string, string_2: string, handle_3: CBaseEntity? )

---[[ CEntityInstance:RemoveSelf  Delete this entity ]]
-- @return void
    function RemoveSelf( self )

---[[ CEntityInstance:SetIntAttr  Set Integer Attribute ]]
-- @return void
-- @param string_1: string
-- @param int_2: int
    function SetIntAttr( self, string_1: string, int_2: int )

---[[ CEntityInstance:entindex   ]]
-- @return int
    function entindex( self ): int
end

declare class CEnvEntityMaker extends CBaseEntity
---[[ CEnvEntityMaker:SpawnEntity  Create an entity at the location of the maker ]]
-- @return void
    function SpawnEntity( self )

---[[ CEnvEntityMaker:SpawnEntityAtEntityOrigin  Create an entity at the location of a specified entity instance ]]
-- @return void
-- @param hEntity handle
    function SpawnEntityAtEntityOrigin( self, hEntity: CBaseEntity? )

---[[ CEnvEntityMaker:SpawnEntityAtLocation  Create an entity at a specified location and orientaton, orientation is Euler angle in degrees (pitch, yaw, roll) ]]
-- @return void
-- @param vecAlternateOrigin Vector
-- @param vecAlternateAngles Vector
    function SpawnEntityAtLocation( self, vecAlternateOrigin: Vector, vecAlternateAngles: Vector )

---[[ CEnvEntityMaker:SpawnEntityAtNamedEntityOrigin  Create an entity at the location of a named entity ]]
-- @return void
-- @param pszName string
    function SpawnEntityAtNamedEntityOrigin( self, pszName: string )
end

declare class CEnvProjectedTexture extends CBaseEntity
---[[ CEnvProjectedTexture:SetFarRange  Set light maximum range ]]
-- @return void
-- @param flRange float
    function SetFarRange( self, flRange: float )

---[[ CEnvProjectedTexture:SetLinearAttenuation  Set light linear attenuation value ]]
-- @return void
-- @param flAtten float
    function SetLinearAttenuation( self, flAtten: float )

---[[ CEnvProjectedTexture:SetNearRange  Set light minimum range ]]
-- @return void
-- @param flRange float
    function SetNearRange( self, flRange: float )

---[[ CEnvProjectedTexture:SetQuadraticAttenuation  Set light quadratic attenuation value ]]
-- @return void
-- @param flAtten float
    function SetQuadraticAttenuation( self, flAtten: float )

---[[ CEnvProjectedTexture:SetVolumetrics  Turn on/off light volumetrics: bool bOn, float flIntensity, float flNoise, int nPlanes, float flPlaneOffset ]]
-- @return void
-- @param bOn bool
-- @param flIntensity float
-- @param flNoise float
-- @param nPlanes int
-- @param flPlaneOffset float
    function SetVolumetrics( self, bOn: boolean, flIntensity: float, flNoise: float, nPlanes: int, flPlaneOffset: float )
end

declare class CEnvTimeOfDay2 extends CBaseEntity
---[[ CEnvTimeOfDay2:GetFloat  Lookup dynamic time-of-day float value ]]
-- @return float
-- @param utlstringtoken_1 utlstringtoken
-- @param float_2: float
    function GetFloat( self, utlstringtoken_1: any, float_2: float )

---[[ CEnvTimeOfDay2:GetVector  Lookup dynamic time-of-day vector value ]]
-- @return Vector
-- @param utlstringtoken_1 utlstringtoken
-- @param Vector_2: Vector
    function GetVector( self, utlstringtoken_1: any, Vector_2: Vector )
end

declare class CHL2_Player
---[[ CHL2_Player:PlayerCounter_CanModifyValue  ( string name, int delta ) ]]
-- @return bool
-- @param string_1: string
-- @param int_2: int
    function PlayerCounter_CanModifyValue( self, name: string, delta: int ): boolean

---[[ CHL2_Player:PlayerCounter_GetValue  ( string name ) ]]
-- @return int
-- @param string_1: string
    function PlayerCounter_GetValue( self, name: string )

---[[ CHL2_Player:PlayerCounter_ModifyValue  ( string name, int delta ) ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
    function PlayerCounter_ModifyValue( self, name: string, int_2: int )

---[[ CHL2_Player:PlayerCounter_SetMax  ( string name, int max ) ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
    function PlayerCounter_SetMax( self, name: string, max: int )

---[[ CHL2_Player:PlayerCounter_SetMin  ( string name, int min ) ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
    function PlayerCounter_SetMin( self, name: string, min: int )

---[[ CHL2_Player:PlayerCounter_SetMinMax  ( string name, int min, int max ) ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
-- @param int_3: int
    function PlayerCounter_SetMinMax( self, name: string, min: int, max: int )

---[[ CHL2_Player:PlayerCounter_SetValue  ( string name, int value ) ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
    function PlayerCounter_SetValue( self, name: string, value: int )
end

declare class CInfoData extends CBaseEntity
---[[ CInfoData:QueryColor  Query color data for this key ]]
-- @return Vector
-- @param tok utlstringtoken
-- @param vDefault Vector
    function QueryColor( self, tok: any, vDefault: Vector )

---[[ CInfoData:QueryFloat  Query float data for this key ]]
-- @return float
-- @param tok utlstringtoken
-- @param flDefault float
    function QueryFloat( self, tok: any, flDefault: Vector )

---[[ CInfoData:QueryInt  Query int data for this key ]]
-- @return int
-- @param tok utlstringtoken
-- @param nDefault int
    function QueryInt( self, tok: any, nDefault: Vector )

---[[ CInfoData:QueryNumber  Query number data for this key ]]
-- @return float
-- @param tok utlstringtoken
-- @param flDefault float
    function QueryNumber( self, tok: any, flDefault: float )

---[[ CInfoData:QueryString  Query string data for this key ]]
-- @return string
-- @param tok utlstringtoken
-- @param pDefault string
    function QueryString( self, tok: any, pDefault: string )

---[[ CInfoData:QueryVector  Query vector data for this key ]]
-- @return Vector
-- @param tok utlstringtoken
-- @param vDefault Vector
    function QueryVector( self, tok: any, vDefault: Vector )
end

declare class CInfoWorldLayer extends CBaseEntity
---[[ CInfoWorldLayer:HideWorldLayer  Hides this layer ]]
-- @return void
    function HideWorldLayer( self )

---[[ CInfoWorldLayer:ShowWorldLayer  Shows this layer ]]
-- @return void
    function ShowWorldLayer( self )
end

declare class CLogicRelay extends CBaseEntity
---[[ CLogicRelay:Trigger  Trigger( hActivator, hCaller ) : Triggers the logic_relay ]]
-- @return void
-- @param hActivator handle
-- @param hCaller handle
    function Trigger( self, hActivator: CBaseEntity?, hCaller: CBaseEntity? )
end

declare class CMarkupVolumeTagged extends CBaseEntity
---[[ CMarkupVolumeTagged:HasTag  Does this volume have the given tag. ]]
-- @return bool
-- @param pszTagName string
    function HasTag( self, pszTagName: string? ): boolean
end

declare class CNativeOutputs extends CBaseEntity
---[[ CNativeOutputs:AddOutput  Add an output ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
    function AddOutput( self, string_1: string, string_2: string )

---[[ CNativeOutputs:Init  Initialize with number of outputs ]]
-- @return void
-- @param int_1: int
    function Init( self, int_1: int )
end

declare function CNativeOutputs(): CNativeOutputs

declare class CPhysicsProp
---[[ CPhysicsProp:DisableMotion  Disable motion for the prop ]]
-- @return void
    function DisableMotion( self )

---[[ CPhysicsProp:EnableMotion  Enable motion for the prop ]]
-- @return void
    function EnableMotion( self )

---[[ CPhysicsProp:SetDynamicVsDynamicContinuous  Enable/disable dynamic vs dynamic continuous collision traces ]]
-- @return void
-- @param bIsDynamicVsDynamicContinuousEnabled bool
    function SetDynamicVsDynamicContinuous( self, bIsDynamicVsDynamicContinuousEnabled: boolean )
end

declare class CPointClientUIWorldPanel
---[[ CPointClientUIWorldPanel:AcceptUserInput  Tells the panel to accept user input. ]]
-- @return void
    function AcceptUserInput( self )

---[[ CPointClientUIWorldPanel:AddCSSClasses  Adds CSS class(es) to the panel ]]
-- @return void
-- @param pszClasses string
    function AddCSSClasses( self, pszClasses: string )

---[[ CPointClientUIWorldPanel:IgnoreUserInput  Tells the panel to ignore user input. ]]
-- @return void
    function IgnoreUserInput( self )

---[[ CPointClientUIWorldPanel:IsGrabbable  Returns whether this entity is grabbable. ]]
-- @return bool
    function IsGrabbable( self ): boolean

---[[ CPointClientUIWorldPanel:RemoveCSSClasses  Remove CSS class(es) from the panel ]]
-- @return void
-- @param pszClasses string
    function RemoveCSSClasses( self, pszClasses: string)
end

declare class CPointTemplate extends CBaseEntity
---[[ CPointTemplate:DeleteCreatedSpawnGroups  DeleteCreatedSpawnGroups() : Deletes any spawn groups that this point_template has spawned. Note: The point_template will not be deleted by this. ]]
-- @return void
    function DeleteCreatedSpawnGroups( self )

---[[ CPointTemplate:ForceSpawn  ForceSpawn() : Spawns all of the entities the point_template is pointing at. ]]
-- @return void
    function ForceSpawn( self )

---[[ CPointTemplate:GetSpawnedEntities  GetSpawnedEntities() : Get the list of the most recent spawned entities ]]
-- @return handle
    function GetSpawnedEntities( self ): { CBaseEntity }

---[[ CPointTemplate:SetSpawnCallback  SetSpawnCallback( hCallbackFunc, hCallbackScope, hCallbackData ) : Set a callback for when the template spawns entities. The spawned entities will be passed in as an array. ]]
-- @return void
-- @param hCallbackFunc handle
-- @param hCallbackScope handle
    function SetSpawnCallback( self, hCallbackFunc: (entities: { CBaseEntity }) -> (), hCallbackScope: any )
end

declare class CPointWorldText extends CBaseEntity
---[[ CPointWorldText:SetMessage  Set the message on this entity. ]]
-- @return void
-- @param pMessage string
    function SetMessage( self, pMessage: string )
end

declare class CPropHMDAvatar extends CBaseEntity
---[[ CPropHMDAvatar:GetVRHand  Get VR hand by ID ]]
-- @return handle
-- @param nHandID int
    function GetVRHand( self, nHandID: int ): CPropVRHand?
end

declare class CPropVRHand
---[[ CPropVRHand:AddHandAttachment  Add the attachment to this hand ]]
-- @return void
-- @param hAttachment handle
    function AddHandAttachment( self, hAttachment: CBaseEntity? )

---[[ CPropVRHand:AddHandModelOverride  Add a model override for this hand ]]
-- @return handle
-- @param pModelName string
    function AddHandModelOverride( self, pModelName: string )

---[[ CPropVRHand:FindHandModelOverride  Find a specific model override for this hand ]]
-- @return handle
-- @param pModelName string
    function FindHandModelOverride( self, pModelName: string )

---[[ CPropVRHand:FireHapticPulse  Fire a haptic pulse on this hand. [0,2] for strength. ]]
-- @return void
-- @param nStrength int
    function FireHapticPulse( self, nStrength: int )

---[[ CPropVRHand:FireHapticPulsePrecise  Fire a haptic pulse on this hand. Specify the duration in micro seconds. ]]
-- @return void
-- @param nPulseDuration int
    function FireHapticPulsePrecise( self, nPulseDuration: int )

---[[ CPropVRHand:GetHandAttachment  Get the attachment on this hand ]]
-- @return handle
    function GetHandAttachment( self ): CBaseEntity?

---[[ CPropVRHand:GetHandID  Get hand ID ]]
-- @return int
    function GetHandID( self ): int

---[[ CPropVRHand:GetLiteralHandType  Get literal type for this hand ]]
-- @return int
    function GetLiteralHandType( self ): int

---[[ CPropVRHand:GetPlayer  Get the player for this hand ]]
-- @return handle
    function GetPlayer( self ): CBasePlayer?

---[[ CPropVRHand:GetVelocity  Get the filtered controller velocity. ]]
-- @return Vector
    function GetVelocity( self ): Vector

---[[ CPropVRHand:RemoveAllHandModelOverrides  Remove all model overrides for this hand ]]
-- @return void
    function RemoveAllHandModelOverrides( self )

---[[ CPropVRHand:RemoveHandAttachmentByHandle  Remove hand attachment by handle ]]
-- @return void
-- @param hAttachment handle
    function RemoveHandAttachmentByHandle( self, hAttachment: CBaseEntity? )

---[[ CPropVRHand:RemoveHandModelOverride  Remove a model override for this hand ]]
-- @return void
-- @param pModelName string
    function RemoveHandModelOverride( self, pModelName: string )

---[[ CPropVRHand:SetHandAttachment  Set the attachment for this hand ]]
-- @return void
-- @param hAttachment handle
    function SetHandAttachment( self, hAttachment: CBaseEntity? )
end

declare class CSceneEntity extends CBaseEntity
---[[ CSceneEntity:AddBroadcastTeamTarget  Adds a team (by index) to the broadcast list ]]
-- @return void
-- @param int_1: int
    function AddBroadcastTeamTarget( self, int_1: int )

---[[ CSceneEntity:Cancel  Cancel scene playback ]]
-- @return void
    function Cancel( self )

---[[ CSceneEntity:EstimateLength  Returns length of this scene in seconds. ]]
-- @return float
    function EstimateLength( self )

---[[ CSceneEntity:FindCamera  Get the camera ]]
-- @return handle
    function FindCamera( self )

---[[ CSceneEntity:FindNamedEntity  given an entity reference, such as !target, get actual entity from scene object ]]
-- @return handle
-- @param string_1: string
    function FindNamedEntity( self, string_1: string )

---[[ CSceneEntity:IsPaused  If this scene is currently paused. ]]
-- @return bool
    function IsPaused( self )

---[[ CSceneEntity:IsPlayingBack  If this scene is currently playing. ]]
-- @return bool
    function IsPlayingBack( self )

---[[ CSceneEntity:LoadSceneFromString  given a dummy scene name and a vcd string, load the scene ]]
-- @return bool
-- @param string_1: string
-- @param string_2: string
    function LoadSceneFromString( self, string_1: string, string_2: string )

---[[ CSceneEntity:RemoveBroadcastTeamTarget  Removes a team (by index) from the broadcast list ]]
-- @return void
-- @param int_1: int
    function RemoveBroadcastTeamTarget( self, int_1: int )

---[[ CSceneEntity:Start  Start scene playback, takes activatorEntity as param ]]
-- @return void
-- @param handle_1: handle
    function Start( self, handle_1: handle )
end

declare class CScriptKeyValues
---[[ CScriptKeyValues:GetValue  Reads a spawn key ]]
-- @return table
-- @param string_1: string
    function GetValue( self, string_1: string ): table
end

declare class CScriptParticleManager
---[[ CScriptParticleManager:CreateParticle  Creates a new particle effect ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
-- @param handle_3: handle
    function CreateParticle( self, string_1: string, int_2: int, handle_3: handle )

---[[ CScriptParticleManager:CreateParticleForPlayer  Creates a new particle effect that only plays for the specified player ]]
-- @return int
-- @param string_1: string
-- @param int_2: int
-- @param handle_3: handle
-- @param handle_4: handle
    function CreateParticleForPlayer( self, string_1: string, int_2: int, handle_3: handle, handle_4: handle )

---[[ CScriptParticleManager:DestroyParticle  (int index, bool bDestroyImmediately) - Destroy a particle, if bDestroyImmediately destroy it without playing caps. ]]
-- @return void
-- @param int_1: int
-- @param bool_2: boolean
    function DestroyParticle( self, int_1: int, bool_2: boolean )

---[[ CScriptParticleManager:GetParticleReplacement   ]]
-- @return string
-- @param string_1: string
-- @param handle_2: handle
    function GetParticleReplacement( self, string_1: string, handle_2: handle )

---[[ CScriptParticleManager:ReleaseParticleIndex  Frees the specified particle index ]]
-- @return void
-- @param int_1: int
    function ReleaseParticleIndex( self, int_1: int )

---[[ CScriptParticleManager:SetParticleAlwaysSimulate   ]]
-- @return void
-- @param int_1: int
    function SetParticleAlwaysSimulate( self, int_1: int )

---[[ CScriptParticleManager:SetParticleControl  Set the control point data for a control on a particle effect ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param Vector_3: Vector
    function SetParticleControl( self, int_1: int, int_2: int, Vector_3: Vector )

---[[ CScriptParticleManager:SetParticleControlEnt   ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param handle_3: handle
-- @param int_4: int
-- @param string_5: string
-- @param Vector_6: Vector
-- @param bool_7: boolean
    function SetParticleControlEnt( self, int_1: int, int_2: int, handle_3: handle, int_4: int, string_5: string, Vector_6: Vector, bool_7: boolean )

---[[ CScriptParticleManager:SetParticleControlForward  (int iIndex, int iPoint, Vector vecForward ) - Set the forward direction for a control on a particle effect ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param Vector_3: Vector
    function SetParticleControlForward( self, int_1: int, int_2: int, Vector_3: Vector )

---[[ CScriptParticleManager:SetParticleControlOffset  (int iIndex, int iPoint, Vector vecOffset ) - Set the linear offset for a control on a particle effect ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param Vector_3: Vector
    function SetParticleControlOffset( self, int_1: int, int_2: int, Vector_3: Vector )

---[[ CScriptParticleManager:SetParticleControlOrientation  (int iIndex, int iPoint, Vector vecForward, Vector vecRight, Vector vecUp) - Set the orientation for a control on a particle effect (NOTE: This is left handed -- bad!!) ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param Vector_3: Vector
-- @param Vector_4: Vector
-- @param Vector_5: Vector
    function SetParticleControlOrientation( self, int_1: int, int_2: int, Vector_3: Vector, Vector_4: Vector, Vector_5: Vector )

---[[ CScriptParticleManager:SetParticleControlOrientationFLU  (int iIndex, int iPoint, Vector vecForward, Vector vecLeft, Vector vecUp) - Set the orientation for a control on a particle effect ]]
-- @return void
-- @param int_1: int
-- @param int_2: int
-- @param Vector_3: Vector
-- @param Vector_4: Vector
-- @param Vector_5: Vector
    function SetParticleControlOrientationFLU( self, int_1: int, int_2: int, Vector_3: Vector, Vector_4: Vector, Vector_5: Vector )
end

declare class CScriptPrecacheContext
---[[ CScriptPrecacheContext:AddResource  Precaches a specific resource ]]
-- @return void
-- @param string_1: string
    function AddResource( self, string_1: string )

---[[ CScriptPrecacheContext:GetValue  Reads a spawn key ]]
-- @return table
-- @param string_1: string
    function GetValue( self, string_1: string )
end

declare class Convars
---[[ Convars:GetBool  GetBool(name) : returns the convar as a boolean flag. ]]
-- @return table
-- @param string_1: string
    function GetBool( self, string_1: string )

---[[ Convars:GetCommandClient  GetCommandClient() : returns the player who issued this console command. ]]
-- @return handle
    function GetCommandClient( self )

---[[ Convars:GetFloat  GetFloat(name) : returns the convar as a float. May return null if no such convar. ]]
-- @return table
-- @param string_1: string
    function GetFloat( self, string_1: string )

---[[ Convars:GetInt  GetInt(name) : returns the convar as an int. May return null if no such convar. ]]
-- @return table
-- @param string_1: string
    function GetInt( self, string_1: string )

---[[ Convars:GetStr  GetStr(name) : returns the convar as a string. May return null if no such convar. ]]
-- @return table
-- @param string_1: string
    function GetStr( self, string_1: string )

---[[ Convars:RegisterCommand  RegisterCommand(name, fn, helpString, flags) : register a console command. ]]
-- @return void
-- @param string_1: string
-- @param handle_2: handle
-- @param string_3: string
-- @param int_4: int
    function RegisterCommand( self, name: string, fn: () -> (), helpString: string, flags: int )

---[[ Convars:RegisterConvar  RegisterConvar(name, defaultValue, helpString, flags): register a new console variable. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
-- @param string_3: string
-- @param int_4: int
    function RegisterConvar( self, name: string, defaultValue: string, helpString: string, flags: int )

---[[ Convars:SetBool  SetBool(name, val) : sets the value of the convar to the bool. ]]
-- @return void
-- @param string_1: string
-- @param bool_2: boolean
    function SetBool( self, name: string, val: boolean )

---[[ Convars:SetFloat  SetFloat(name, val) : sets the value of the convar to the float. ]]
-- @return void
-- @param string_1: string
-- @param float_2: float
    function SetFloat( self, name: string, val: float )

---[[ Convars:SetInt  SetInt(name, val) : sets the value of the convar to the int. ]]
-- @return void
-- @param string_1: string
-- @param int_2: int
    function SetInt( self, name: string, val: int )

---[[ Convars:SetStr  SetStr(name, val) : sets the value of the convar to the string. ]]
-- @return void
-- @param string_1: string
-- @param string_2: string
    function SetStr( self, name: string, val: string )
end

-- TODO: Is this used?
declare class Decider
---[[ Decider:AddRule  AddRule(CRule) : Add a CRule object (defined in rulescript_base.nut)  ]]
-- @return bool
-- @param handle_1: handle
    function AddRule( self, handle_1: handle )

---[[ Decider:FindAllMatches  Binding_FindAllMatches(query,leeway) : Returns an array of all matching responses. If leeway is nonzero, all results scoring within 'leeway' of the best score return.  ]]
-- @return handle
-- @param handle_1: handle
-- @param float_2: float
    function FindAllMatches( self, handle_1: handle, float_2: float )

---[[ Decider:FindBestMatch  Binding_FindBestMatch(query) : Query the database and return the best result found. If multiple of equal score found, an arbitrary one returns.  ]]
-- @return handle
-- @param handle_1: handle
    function FindBestMatch( self, handle_1: handle )
end

declare class GlobalSys
---[[ GlobalSys:CommandLineCheck  CommandLineCheck(name) : returns true if the command line param was used, otherwise false. ]]
-- @return table
-- @param string_1: string
    function CommandLineCheck( self, string_1: string ): boolean

---[[ GlobalSys:CommandLineFloat  CommandLineFloat(name) : returns the command line param as a float. ]]
-- @return table
-- @param string_1: string
-- @param float_2: float
    function CommandLineFloat( self, string_1: string, float_2: float ): float

---[[ GlobalSys:CommandLineInt  CommandLineInt(name) : returns the command line param as an int. ]]
-- @return table
-- @param string_1: string
-- @param int_2: int
    function CommandLineInt( self, string_1: string, int_2: int ): int

---[[ GlobalSys:CommandLineStr  CommandLineStr(name) : returns the command line param as a string. ]]
-- @return table
-- @param string_1: string
-- @param string_2: string
    function CommandLineStr( self, string_1: string, string_2: string ): string
end

-- TODO: Is this used?
declare class SteamInfo
---[[ SteamInfo:IsPublicUniverse  Is the script connected to the public Steam universe ]]
-- @return bool
    function IsPublicUniverse( self )
end

-- global accessors
declare Convars: Convars
declare Entities: CEntities
declare GlobalSys: GlobalSys
declare debugoverlay: CDebugOverlayScriptHelper
declare ParticleManager: CScriptParticleManager
declare CustomGameEventManager: CCustomGameEventManager
declare thisEntity: CEntityInstance

-- global flags
declare FCVAR_REPLICATED: int