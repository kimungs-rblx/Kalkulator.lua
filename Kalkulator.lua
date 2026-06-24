# Loader Script
Copy and paste this script into your executor:
```lua
loadstring(game:HttpGet("https://githubusercontent.com"))()
```
`loadstring(game:HttpGet("https://githubusercontent.com"))()`
``
-# Dont share your script with anyone else

---

### 2. Isi Script Utama (Upload ke GitHub / Pastebin)
Simpan dan unggah (*upload*) seluruh kode Roblox Lua di bawah ini ke hosting online Anda (seperti GitHub atau Pastebin). Ganti link `https://githubusercontent.com...` pada Script Loader di atas dengan link **Raw** dari file ini:

```lua
-- Membuat ScreenGui Utama
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")

-- Label dan Input untuk "Value Inventory"
local LabelHarga = Instance.new("TextLabel")
local InputHarga = Instance.new("TextBox")

-- Label dan Input untuk "Value X Saat Ini"
local LabelX = Instance.new("TextLabel")
local InputX = Instance.new("TextBox")

-- Label dan Input untuk "Base Value X1"
local LabelTarget = Instance.new("TextLabel")
local InputTarget = Instance.new("TextBox")

-- Kotak Hasil (Result Box)
local ResultBox = Instance.new("Frame")
local ResultCorner = Instance.new("UICorner")
local ResultTitle = Instance.new("TextLabel")
local ResultValue = Instance.new("TextLabel")

-- Garis Pembatas Samping Merah pada Kotak Hasil
local LeftBorder = Instance.new("Frame")

-- Teks Footer @kimungs
local Footer = Instance.new("TextLabel")

-- Tombol Close (Silang) untuk menutup GUI
local CloseButton = Instance.new("TextButton")

-- Mengarahkan langsung ke PlayerGui lokal agar kompatibel dengan Delta
ScreenGui.Name = "KalkulatorBaseValueFix"
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Properti Frame Utama (Desain Responsif untuk Mobile)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -220)
MainFrame.Size = UDim2.new(0, 300, 0, 440)
MainFrame.Active = true
MainFrame.Draggable = true -- Membuat UI bisa digeser-geser di layar HP

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Judul Utama
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 15)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🍎 Kalkulator Base Value"
Title.TextColor3 = Color3.fromRGB(231, 76, 60)
Title.TextSize = 22

-- Subjudul
Subtitle.Parent = MainFrame
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0, 10, 0, 40)
Subtitle.Size = UDim2.new(1, -20, 0, 30)
Subtitle.Font = Enum.Font.SourceSans
Subtitle.Text = "Menghitung base value secara otomatis."
Subtitle.TextColor3 = Color3.fromRGB(127, 140, 141)
Subtitle.TextSize = 13
Subtitle.TextWrapped = true

-- Fungsi Pembantu untuk Membuat Desain Form Input
local function createInputField(labelName, defaultVal, posY, placeholder)
    local label = Instance.new("TextLabel")
    label.Parent = MainFrame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 20, 0, posY)
    label.Size = UDim2.new(1, -40, 0, 20)
    label.Font = Enum.Font.SourceSansBold
    label.Text = labelName
    label.TextColor3 = Color3.fromRGB(44, 62, 80)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    local input = Instance.new("TextBox")
    input.Parent = MainFrame
    input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    input.Position = UDim2.new(0, 20, 0, posY + 22)
    input.Size = UDim2.new(1, -40, 0, 35)
    input.Font = Enum.Font.SourceSans
    input.Text = defaultVal
    input.PlaceholderText = placeholder
    input.TextColor3 = Color3.fromRGB(44, 62, 80)
    input.TextSize = 16
    
    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = input

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(220, 221, 225)
    stroke.Thickness = 1.5
    stroke.Parent = input

    input.Focused:Connect(function() stroke.Color = Color3.fromRGB(231, 76, 60) end)
    input.FocusLost:Connect(function() stroke.Color = Color3.fromRGB(220, 221, 225) end)

    return input
end

-- Inisialisasi Input Form sesuai kode HTML Anda
InputHarga = createInputField("Value Inventory :", "1000", 80, "Masukkan angka...")
InputX = createInputField("Value X Saat Ini :", "0.50", 150, "Masukkan angka...")
InputTarget = createInputField("Base Value X1 :", "1", 220, "Masukkan angka...")

-- Pengaturan Kotak Hasil Real-time
ResultBox.Name = "ResultBox"
ResultBox.Parent = MainFrame
ResultBox.BackgroundColor3 = Color3.fromRGB(255, 245, 245)
ResultBox.Position = UDim2.new(0, 20, 0, 295)
ResultBox.Size = UDim2.new(1, -40, 0, 65)

ResultCorner.CornerRadius = UDim.new(0, 4)
ResultCorner.Parent = ResultBox

LeftBorder.Parent = ResultBox
LeftBorder.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
LeftBorder.Size = UDim2.new(0, 4, 1, 0)
LeftBorder.BorderSizePixel = 0

ResultTitle.Parent = ResultBox
ResultTitle.BackgroundTransparency = 1
ResultTitle.Position = UDim2.new(0, 15, 0, 8)
ResultTitle.Size = UDim2.new(1, -20, 0, 15)
ResultTitle.Font = Enum.Font.SourceSansBold
ResultTitle.Text = "TOTAL BASE VALUE X1"
ResultTitle.TextColor3 = Color3.fromRGB(127, 140, 141)
ResultTitle.TextSize = 11
ResultTitle.TextXAlignment = Enum.TextXAlignment.Left

ResultValue.Parent = ResultBox
ResultValue.BackgroundTransparency = 1
ResultValue.Position = UDim2.new(0, 15, 0, 25)
ResultValue.Size = UDim2.new(1, -20, 0, 35)
ResultValue.Font = Enum.Font.SourceSansBold
ResultValue.Text = "2000.00"
ResultValue.TextColor3 = Color3.fromRGB(231, 76, 60)
ResultValue.TextSize = 24
ResultValue.TextXAlignment = Enum.TextXAlignment.Left

-- Teks Footer @kimungs
Footer.Parent = MainFrame
Footer.BackgroundTransparency = 1
Footer.Position = UDim2.new(0, 0, 0, 380)
Footer.Size = UDim2.new(1, 0, 0, 20)
Footer.Font = Enum.Font.SourceSansSemibold
Footer.Text = "@kimungs"
Footer.TextColor3 = Color3.fromRGB(164, 176, 190)
Footer.TextSize = 14

-- Tombol Tutup (X)
CloseButton.Parent = MainFrame
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -30, 0, 10)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(127, 140, 141)
CloseButton.TextSize = 16

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- LOGIKA KALKULASI REAL-TIME
local function hitungHarga()
    local hargaAwal = tonumber(InputHarga.Text)
    local xAwal = tonumber(InputX.Text)
    local xTarget = tonumber(InputTarget.Text)
    
    if hargaAwal and xAwal and xTarget and xAwal > 0 then
        local hargaDasar = hargaAwal / xAwal
        local hargaTarget = hargaDasar * xTarget
        ResultValue.Text = string.format("%.2f", hargaTarget)
    else
        ResultValue.Text = "Input Salah"
    end
end

-- Hubungkan Event Perubahan Teks Input dengan Fungsi Hitung
InputHarga:GetPropertyChangedSignal("Text"):Connect(hitungHarga)
InputX:GetPropertyChangedSignal("Text"):Connect(hitungHarga)
InputTarget:GetPropertyChangedSignal("Text"):Connect(hitungHarga)

-- Eksekusi Kalkulasi Pertama saat UI Muncul
hitungHarga()
```
