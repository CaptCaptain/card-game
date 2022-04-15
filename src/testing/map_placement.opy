settings {
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "kanezaka"
            ]
        }
    },
    "heroes": {
        "allTeams": {
            "general": {
                "abilityCooldown%":0
            }
        }
    }
}

globalvar map_center = vect(0, 0, 0)
globalvar map_radius = 6
globalvar chase_map_pos = false
globalvar spot_index = 0

#!define sortedPlayers() sorted(getAllPlayers(), lambda x: x.getSlot())

#!define theta(totalPoints) ((Math.PI*2) / totalPoints)
#!define angle(currentPoint, totalPoints) (theta(totalPoints) * currentPoint)
#!define getX(slot, radius) radius * cos(angle(slot, 12))
#!define getZ(slot, radius) radius * sin(angle(slot, 12))

#!define getSpot(slot) map_center + vect(getX(slot, map_radius), 0, getZ(slot, map_radius))

rule "Effects":
    hudHeader(getAllPlayers(), map_center, HudPosition.TOP, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    hudHeader(getAllPlayers(), map_radius, HudPosition.TOP, 3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)

    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, updateEveryTick(map_center), 2, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

    for spot_index in range(0, 12, 1):
        createEffect(getAllPlayers(), Effect.RING, Color.WHITE, updateEveryTick(getSpot(evalOnce(spot_index))), 1.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)

rule "Toggle Chase Map Position":
    @Condition hostPlayer.isHoldingButton(Button.INTERACT)

    chase_map_pos = not chase_map_pos

    wait(0.025)

rule "Chase Map Position":
    @Condition chase_map_pos

    chase(map_center, raycast(hostPlayer.getEyePosition(), hostPlayer.getEyePosition() + (hostPlayer.getFacingDirection() * 1000), null, null, false).getHitPosition(), rate=9999, ChaseReeval.DESTINATION_AND_RATE)

rule "Stop Chasing Map Position":
    @Condition not chase_map_pos

    stopChasingVariable(map_center)

rule "Disable":
    @Condition hostPlayer.hasSpawned()

    hostPlayer.disallowButton(Button.PRIMARY_FIRE)
    hostPlayer.disallowButton(Button.SECONDARY_FIRE)

rule "Increase Radius":
    @Condition hostPlayer.isHoldingButton(Button.PRIMARY_FIRE)

    map_radius += 1

rule "Decrease Radius":
    @Condition hostPlayer.isHoldingButton(Button.SECONDARY_FIRE)

    map_radius -= 1