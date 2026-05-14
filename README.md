# Waybar Config — Panduan Instalasi

## Struktur File
```
~/.config/waybar/
├── config.jsonc          ← Konfigurasi utama
├── style.css             ← Styling & tema
└── scripts/
    └── power-menu.sh     ← Script power menu
```

## Instalasi

### 1. Copy semua file
```bash
mkdir -p ~/.config/waybar/scripts
cp config.jsonc  ~/.config/waybar/config.jsonc
cp style.css     ~/.config/waybar/style.css
cp scripts/power-menu.sh ~/.config/waybar/scripts/power-menu.sh
chmod +x ~/.config/waybar/scripts/power-menu.sh
```

### 2. Install dependensi yang dibutuhkan
```bash
# Arch Linux
sudo pacman -S waybar ttf-jetbrains-mono-nerd pavucontrol pipewire wireplumber

# Untuk power menu, minimal salah satu dari:
sudo pacman -S wofi
# atau
sudo pacman -S rofi-wayland
```

### 3. Sesuaikan interface jaringan
Cek nama interface LAN kamu:
```bash
ip link show
```
Lalu edit `config.jsonc`, cari baris:
```json
"interface": "eth0"   // ← ganti ke nama interface kamu
```
Contoh: `enp3s0`, `eno1`, `wlan0`, `wlp2s0`

---

## ✏️ Cara Adjust Ukuran Bar

Semua ukuran dikontrol dari **satu tempat** di `style.css`, bagian atas:

```css
* {
    --bar-height:        36px;    /* Tinggi bar keseluruhan     */
    --font-size:         13px;    /* Ukuran teks modul          */
    --font-size-icon:    15px;    /* Ukuran icon power button   */
    --module-padding:    0 10px;  /* Padding kiri-kanan modul   */
    --module-margin:     2px;     /* Jarak antar modul          */
    --module-radius:     8px;     /* Radius sudut modul         */
    --ws-size:           28px;    /* Ukuran kotak workspace     */
    --ws-font-size:      14px;    /* Font angka workspace       */
}
```

Dan di `config.jsonc`:
```json
"height": 36,    // << Tinggi bar (harus sama dengan --bar-height di CSS)
"spacing": 4,    // << Jarak antar modul
```

### Preset ukuran yang direkomendasikan:

| Tampilan | height | --font-size | --ws-size |
|----------|--------|-------------|-----------|
| Compact  | 28px   | 11px        | 22px      |
| Normal   | 36px   | 13px        | 28px      |
| Large    | 44px   | 15px        | 34px      |
| XL       | 52px   | 17px        | 40px      |

---

## Reload Waybar
```bash
# Kill dan restart
pkill waybar && waybar &

# Atau jika pakai systemd user service
systemctl --user restart waybar
```

---

## Fitur Modul

| Modul | Klik Kiri | Klik Kanan | Scroll |
|-------|-----------|------------|--------|
| Logo | Buka rofi/app launcher | — | — |
| Network | — | nm-connection-editor | — |
| Audio | Buka pavucontrol | Toggle mute | Volume ±5% |
| Clock | Toggle format tanggal | Ganti mode kalender | Geser bulan |
| Power Menu | Tampilkan menu | — | — |

---

## Catatan Hyprland
Tambahkan ke `~/.config/hypr/hyprland.conf`:
```conf
exec-once = waybar
```
