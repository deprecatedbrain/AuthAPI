local HttpService = game:GetService("HttpService")
local AuthAPI = {}

local AUTHENTICATION_URL = "https://www.authenticatorapi.com/Validate.aspx?Pin=%s&SecretCode=%s"
local QRCODE_URL = "https://www.authenticatorapi.com/pair.aspx?AppName=%s&AppInfo=%s&SecretCode=%s"

function AuthAPI.CheckPinAsync(
	code: string | number,
	secret: string
): boolean

	assert(
		tonumber(code) ~= nil,
		"Code must be number"
	)

	assert(
		typeof(secret) == 'string',
		"Secret must be string"
	)

	local requestUrl = string.format(
		AUTHENTICATION_URL,
		code, secret
	)

	local wasRequestSuccessful, result = pcall(
		HttpService.GetAsync, HttpService,
		requestUrl
	)

	if wasRequestSuccessful then
		if result == "True" then
			return true
		elseif result == "False" then
			return false
		else
			error("Invalid result returned\n Result: ".. result)
		end
	else
		error("Remote request failed\n Error: ".. result)
	end
end

function AuthAPI.GetQRCodeURL(
	appName: string,
	appInfo: string,
	secret: string
): string

	assert(
		typeof(appName) == 'string',
		"AppName must be string"
	)

	assert(
		typeof(appInfo) == 'string',
		"AppInfo must be string"
	)

	assert(
		typeof(secret) == 'string',
		"Secret must be string"
	)

	return string.format(
		QRCODE_URL,
		appName, appInfo, secret
	)
end

return AuthAPI