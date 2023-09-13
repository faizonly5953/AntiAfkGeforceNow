; Fungsi untuk menggerakkan mouse secara mulus
SmoothMouseMove(TargetX, TargetY, Speed := 10) {
    CoordMode, Mouse, Screen
    MouseGetPos, StartX, StartY
    Steps := Speed * 10
    XDelta := (TargetX - StartX) / Steps
    YDelta := (TargetY - StartY) / Steps
    
    Loop, % Steps {
        NewX := StartX + (A_Index * XDelta)
        NewY := StartY + (A_Index * YDelta)
        MouseMove, % NewX, % NewY, 0
        Sleep, 10
    }
    
    MouseMove, % TargetX, % TargetY, 0
}

; Fungsi untuk menunggu antara 10 hingga 15 detik
RandomSleep() {
    Random, SleepTime, 10000, 15000
    Sleep, %SleepTime%
}

; Variabel global untuk mengontrol apakah skrip harus berhenti
global StopScript := False

; Tombol yang akan memulai skrip
F1::StartRandomMouseMovement()

; Tombol yang akan menghentikan skrip
F2::StopScript := True

StartRandomMouseMovement() {
    CoordMode, Mouse, Screen
    StopScript := False  ; Atur ulang variabel StopScript ke False
    Loop {
        Random, TargetX, 1, A_ScreenWidth
        Random, TargetY, 1, A_ScreenHeight
        
        ; Periksa apakah skrip harus dihentikan
        if StopScript
            break  ; Keluar dari loop jika StopScript adalah True
        
        SmoothMouseMove(TargetX, TargetY)
        RandomSleep()
    }
}
