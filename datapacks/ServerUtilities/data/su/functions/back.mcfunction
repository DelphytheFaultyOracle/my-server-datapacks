#tp to back location
execute at @s as @e[tag=back] if score @s ids = @p ids run tp @p @s

#user feedback
execute as @s at @s run playsound minecraft:item.chorus_fruit.teleport master @s ~ ~ ~ 10 1
execute as @s at @s run tellraw @s {"text":"Teleported Back","color":"green"}