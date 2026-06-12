# SSR-SKILLS

高質量 AI Agent 技能庫，經過四維度審計（設計質量/內容質量/安全性/實用性），按 S/A/B/C 分級。

## 📊 分級統計

| 等級 | 數量 | 說明 |
|------|------|------|
| **S 級** | 17 | 卓越 — 可直接使用 |
| **A 級** | 15 | 優良 — 少量優化空間 |
| **B 級** | 3 | 可用 — 建議改進 |
| **C 級** | 0 | 全部達標 |

## 📁 目錄結構

```
SSR-SKILLS/
├── S-grade/          # S 級技能（17 個）
├── A-grade/          # A 級技能（15 個）
├── B-grade/          # B 級技能（3 個）
├── examples/         # 測試輸出示例
├── skillsAudit-SABC.md  # 完整審計報告
└── README.md
```

## 🔧 安裝使用

1. 下載對應等級的 zip 文件
2. 解壓到 `~/.agents/skills/` 目錄
3. 重啟 AI Agent 即可使用

```bash
# 安裝 S 級技能（推薦）
unzip S-grade/seo-blog-writer-3.2.0.zip -d ~/.agents/skills/
```

## 📋 審計標準

四維度評分（滿分 10）：
- **D1 設計質量**：Frontmatter、文件組織、Token 效率
- **D2 內容質量**：觸發條件、執行步驟、錯誤處理
- **D3 安全性**：SQL 注入、密碼存儲、權限控制
- **D4 實用性**：輸出格式、使用場景、依賴說明

## 📄 授權

MIT License
