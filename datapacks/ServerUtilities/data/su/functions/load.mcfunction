tellraw @a {"text":"Server Utilites Reloaded","color":"green"}

# teams
team add admin {"text":"admin"}
team modify admin prefix {"text":"[admin] ","color":"red"}
team add mod {"text":"moderator"}
team modify mod prefix {"text":"[moderator] ","color":"blue"}
team add member {"text":"member"}
team modify member prefix {"text":"[member] ","color":"green"}
team add camera {"text":"camera"}
team modify camera prefix {"text":"[camera] ","color":"gray"}
team modify camera color gray
team modify camera seeFriendlyInvisibles true

#create scorebaords and setup variables

#ids
scoreboard objectives add ids dummy {"text":"Ids","color":"light_purple"}
scoreboard players add count ids 0

# set home
scoreboard objectives add chunk_x dummy {"text":"Set Home Chunk X","color":"aqua"}
scoreboard players set div chunk_x 16

scoreboard objectives add chunk_z dummy {"text":"Set Home Chunk z","color":"yellow"}
scoreboard players set div chunk_z 16

scoreboard objectives add chunk_ops dummy {"text":"Chunk Operations","color":"gold"}
scoreboard players set scale chunk_ops 10
scoreboard players set offset chunk_ops 5

scoreboard objectives add chunk_found dummy {"text":"If Other Found in Chunk","color":"red"}

# camera 
scoreboard objectives add camera_active dummy {"text":"Actived Camera Accounts","color":"gray"}
scoreboard objectives add camera_role dummy {"text":"Camera Accounts Roles","color":"gray"}

# multiplayer sleep
scoreboard objectives add sleep_active minecraft.custom:sleep_in_bed {"text":"Slept in Bed Counter", "color":"blue"}
scoreboard players add @a sleep_active 0

#storage
# chunk:x - stores double for centering armor_stands
# chunk:z - stores double for centering armor_stands