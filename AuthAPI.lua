local HttpService = game:GetService("HttpService")
local authAPI = {}

function authAPI.CheckPin(code, secret)
	local requesturl = "https://www.authenticatorapi.com/Validate.aspx?Pin="..code.."&SecretCode="..secret
	local check = HttpService:GetAsync(requesturl)
	if check == "True" then
		return true
	else
		return false
	end
end

function authAPI.GetQRCode(secret, AppName, AppInfo)
	local requesturl = "https://www.authenticatorapi.com/pair.aspx?AppName="..AppName.."&AppInfo="..AppInfo.."&SecretCode="..secret
	return requesturl
end

return authAPI
