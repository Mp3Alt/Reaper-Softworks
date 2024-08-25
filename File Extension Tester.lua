local Output = {Pass = {}, Fail = {}};
local extensions = {
    -- Windows
    'exe', 'bat', 'cmd', 'vbs', 'ps1', 'msi', 'scr', 'hta', 'pif', 'com',
    -- Unix/Linux
    'sh', 'bash',
    -- MacOS
    'command', 'rb',
    -- Web Development
    'php', 'asp', 'aspx', 'jsp', 'js',
    -- Cross-Platform
    'jar', 'py', 'pl',
    -- Others
    'dll', 'so', 'class', 'psm1', 'vb'
}

makefolder('File_Test');

local function CheckExtension(extension)
    local function testFunction(ext)
        return pcall(writefile, 'File_Test/test.'.. ext, 'Test');
    end

    if testFunction(extension) or testFunction(string.upper(extension)) then
        table.insert(Output.Fail, extension);
    else
        table.insert(Output.Pass, extension);
    end
end

for _, ext in ipairs(extensions) do
    CheckExtension(ext);
end

for status, list in pairs(Output) do
	local symbol = status == 'Fail' and '❌' or '✅';
	for _, ext in ipairs(list) do
		output = status == 'Fail' and warn or print;
		output(symbol .. ' .'.. ext);
	end
end


print('| File Extension Tester | Reaper Softworks');
print(string.format('| ✅ Blocked - %d | ❌ Not Blocked - %d\n', #Output.Pass, #Output.Fail));
