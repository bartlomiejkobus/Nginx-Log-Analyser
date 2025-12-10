# Nginx-Log-Analyser

Simple Bash script to analyze **Nginx access logs** from the command line, including top IP addresses, requested paths, status codes, and user agents.

This project is inspired by the [DevOps Roadmap](https://roadmap.sh/projects/nginx-log-analyser).


---

## Features

- Top 5 **IP addresses** by number of requests
- Top 5 **requested paths**
- Top 5 **response status codes**
- Top 5 **user agents**
- Fully automated counting, sorting, and formatting using a reusable function
- Easy to run in any terminal
- Handles multi-word User-Agent strings properly

---

## Requirements

- Linux environment
- Bash shell
- Standard Linux tools: `awk`, `sort`, `uniq`, `head`

---

## Usage

1. Make the script executable:

```bash
chmod +x nginx-log-analyser.sh
```

2. Run the script, passing the path to your log file:

```bash
./nginx-log-analyser.sh /path/to/access.log
```

---

## Example Output

```bash
Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests

Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests

Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 192 requests
"-" - 31 requests

Top 5 user agents:
DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com) - 4347 requests
Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 513 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 - 332 requests
Custom-AsyncHttpClient - 294 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 - 282 requests
```

---

## Notes
- The script uses a **reusable function** that extracts log columns with awk and counts/sorts the top entries using `"sort | uniq -c | sort -nr | head -5"`.
- Works with standard Nginx access log formats.
- User-Agent extraction handles multi-word strings using awk with " as the field separator.
- Make sure your log file path is correct when running the script.

