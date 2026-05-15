
# AuthAPI
A simple way to use an authentication app in Roblox

> [!CAUTION]
> I don't recommend you use this for any real work. I made it a long time ago and didn't follow the best practices. It's on my todo list to remake, but it's not not very high.

API
-
 **authAPI.GetQRCodeURL(AppName, AppInfo, Secret)**
 _Generates a URL that links to a QR code to scan with your authentication app_
 
- **AppName (string)** : The name of your app
- **AppInfo (string)** : Info on your app
- **Secret (string)**` : The secret you want to use to generate the QR code (keep this safe, it will be used when you want to validate a pin)

Returns : `URL (string)`

---
**authAPI.CheckPinAsync(code, secret)**
_Returns  `true`  if the code matches with the secret,  `false`  if it doesn’t_
- **code (number)** : The code you would like to check
- **secret (string)** : The secret you want to use to validate the code. Same as the secret in GetQRCode

Returns : `Valid (boolean)`

# Example
**Gets URL with QR code** (don't show in-game, could get your game banned.)
```lua
-- Reccomended to keep it somewhere the client can't see, but it depends on what you're doing.
local authapi = require(game:GetService("ServerStorage").AuthAPI)

print(authapi.GetQRCodeURL("Very cool", "Very Cool Inc.", "abc123"))
```
Expected output : `https://www.authenticatorapi.com/pair.aspx?AppName=Very cool&AppInfo=Very Cool Inc.&SecretCode=abc123`

---
**Validates the code with the secret**
```lua
local authapi = require(game:GetService("ServerStorage").AuthAPI)

print(authapi.CheckPinAsync(123456, "abc123"))
```
Expected output : `true` if pin matches `false` if pin doesn't match.

---
Last updated 12/13/21
