# 🛰️ GPS-COMPASS

> "Silence. Movement. Direction."

A stealth Bash-based GPS compass that reads live GPS data, calculates heading, smooths movement, and translates raw degrees into human-readable compass directions.

No GUI.  
No noise.  
Just signal.

---

## ⚡ Overview

`payload.sh` is a lightweight terminal-based GPS compass that:

- Reads real-time GPS data via `gpspipe`
- Extracts heading and speed
- Smooths directional data for stability
- Converts degrees into 16-point compass directions
- Displays current GPS coordinates
- Optionally resolves location via OpenStreetMap

Built for minimal environments.  
Designed for terminal operators.

---

## 🧠 Features

- 🧭 16-point compass direction mapping
- 📡 Real-time GPS heading tracking
- 📊 Movement smoothing (configurable samples)
- 🚀 Speed detection in km/h
- 🌍 Reverse geolocation (OpenStreetMap)
- 📴 Offline fallback mode
- 🔥 Clean terminal output

---

## 🛠 Requirements

- `bash`
- `gpsd`
- `gpspipe`
- `curl`
- `jq`
- Internet connection (optional, for map lookup)

---

## ⚙️ Configuration

Inside the script:

```bash
MIN_SPEED_KMH=1
SMOOTH_SAMPLES=5
```

Adjust:
- Minimum movement detection threshold
- Number of heading samples used for smoothing

---

## 🚀 Usage

```bash
chmod +x payload.sh
./payload.sh
```

Press any key to terminate.

---

## 🛰 How It Works

1. Listens to `gpspipe -w` JSON stream  
2. Filters `"class":"TPV"` packets  
3. Extracts:
   - `track` → heading
   - `speed` → movement speed  
4. Converts m/s → km/h  
5. Averages recent headings  
6. Maps degrees → 16-point compass  
7. Displays live output  

Minimal. Direct. Effective.

---

## 📍 Location Lookup

If online, the script queries:

```
https://nominatim.openstreetmap.org
```

And displays a formatted address based on current coordinates.

If offline, it falls back to raw GPS coordinates.

---

## 🔒 Operational Mode

- If stationary → shows last known direction  
- If no GPS fix → waits silently  
- If offline → skips reverse lookup  

Designed for resilience.


## ⚠ Disclaimer

For educational and experimental use only.  
Ensure compliance with local regulations when accessing GPS hardware.

---

## 🧩 Version

1.0
