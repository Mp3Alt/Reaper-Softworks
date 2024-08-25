local Output = {Pass = {}, Fail = {}};
makefolder('File_Test');

local function CheckExtension(extention)
    local Success, Message = pcall(function()
        return writefile('File_Test/test.'.. extention, 'Test')
    end)
    local Success2, Message = pcall(function()
        return writefile('File_Test/test.'.. string.upper(extention), 'Test')
    end)

    if Success or Success2 then
        table.insert(Output.Fail, extention);
    else
        table.insert(Output.Pass, extention);
    end
end


-- Windows --
CheckExtension('exe');
CheckExtension('bat');
CheckExtension('cmd');
CheckExtension('vbs');
CheckExtension('ps1');
CheckExtension('msi');
CheckExtension('scr');
CheckExtension('hta');
CheckExtension('pif');

-- Unix/Linux --
CheckExtension('sh');
CheckExtension('bash');
CheckExtension('py');
CheckExtension('rb');

-- MacOS --
CheckExtension('command');
CheckExtension('sh');
CheckExtension('bash');
CheckExtension('rb');

-- Web Development --
CheckExtension('php');
CheckExtension('asp');
CheckExtension('aspx');
CheckExtension('jsp');
CheckExtension('js');

-- Cross-Platform --
CheckExtension('jar');
CheckExtension('py');
CheckExtension('pl');

-- Others --
CheckExtension('dll');
CheckExtension('so');
CheckExtension('class');
CheckExtension('psm1');
CheckExtension('vb');

print('\n\n');
for i,v in pairs(Output) do
    if i == 'Fail' then
        for i,v in pairs(v) do
            warn('❌ .'.. v)
        end
    else
        for i,v in pairs(v) do
            print('✅ .'.. v)
        end
    end
end

print('| File Extension Tester | Reaper Softworks');
print(`| ✅ Blocked - {#Output.Pass} | ❌ Not Blocked - {#Output.Fail}\n`);
