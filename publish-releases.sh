#!/bin/bash
# publish-releases.sh — 為每個 S/A 級技能創建 GitHub Release
# 使用方式: 認證 gh 後執行 ./publish-releases.sh

set -e

REPO="uber6188-bot/SSR-SKILLS"
TAG_PREFIX="skill"

echo "=== GitHub Release Publisher ==="
echo ""

# Check gh auth
if ! gh auth status &>/dev/null; then
    echo "❌ 請先執行 gh auth login"
    exit 1
fi

# S-grade releases
echo "--- S-grade (17 個) ---"
for zip in S-grade/*.zip; do
    name=$(basename "$zip" .zip)
    version=$(echo "$name" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+$')
    tag="${TAG_PREFIX}/${name}"
    
    # Check if release already exists
    if gh release view "$tag" &>/dev/null; then
        echo "⏭️ $name v$version (已存在)"
        continue
    fi
    
    # Create release
    gh release create "$tag" \
        --repo "$REPO" \
        --title "$name v$version (S級)" \
        --notes "S 級技能 — 卓越品質，可直接使用" \
        "$zip" \
        2>/dev/null && echo "✅ $name v$version" || echo "❌ $name v$version"
done

echo ""
echo "--- A-grade (15 個) ---"
for zip in A-grade/*.zip; do
    name=$(basename "$zip" .zip)
    version=$(echo "$name" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+$')
    tag="${TAG_PREFIX}/${name}"
    
    if gh release view "$tag" &>/dev/null; then
        echo "⏭️ $name v$version (已存在)"
        continue
    fi
    
    gh release create "$tag" \
        --repo "$REPO" \
        --title "$name v$version (A級)" \
        --notes "A 級技能 — 優良品質" \
        "$zip" \
        2>/dev/null && echo "✅ $name v$version" || echo "❌ $name v$version"
done

echo ""
echo "=== 完成 ==="
echo "查看: https://github.com/$REPO/releases"
