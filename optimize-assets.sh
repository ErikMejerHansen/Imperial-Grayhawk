#!/bin/bash

# Asset Optimization Script for Imperial Grayhawk
# This script optimizes PNG and JPG images while preserving originals
# Output directory: optimized-assets/

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
OUTPUT_DIR="optimized-assets"
QUALITY=85  # Quality for JPG compression (1-100)
PNG_QUALITY="65-80"  # Quality range for PNG compression

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Imperial Grayhawk Asset Optimizer${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo -e "${YELLOW}Error: ImageMagick not found. Please install it first.${NC}"
    echo ""
    echo "On Ubuntu/Debian:"
    echo "  sudo apt-get install imagemagick pngquant"
    echo ""
    echo "On macOS:"
    echo "  brew install imagemagick pngquant"
    echo ""
    exit 1
fi

# Check if pngquant is available (optional, for better PNG compression)
HAS_PNGQUANT=false
if command -v pngquant &> /dev/null; then
    HAS_PNGQUANT=true
    echo -e "${GREEN}✓ pngquant found - will use for PNG optimization${NC}"
else
    echo -e "${YELLOW}! pngquant not found - will use ImageMagick for PNG optimization${NC}"
fi

# Create output directory structure
echo -e "${BLUE}Creating output directory structure...${NC}"
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/assets"
mkdir -p "$OUTPUT_DIR/maps"

# Function to get file size (cross-platform)
get_file_size() {
    local file="$1"
    # Try Linux first (stat -c%s), then fall back to macOS/BSD (stat -f%z)
    stat -c%s "$file" 2>/dev/null || stat -f%z "$file" 2>/dev/null
}

# Function to optimize PNG files
optimize_png() {
    local input_file="$1"
    local output_file="$2"
    local original_size=$(get_file_size "$input_file")
    
    echo -e "  Processing: ${input_file}"
    
    if [ "$HAS_PNGQUANT" = true ]; then
        # Use pngquant for better PNG compression
        pngquant --quality="$PNG_QUALITY" --force --output "$output_file" "$input_file" 2>/dev/null || {
            # Fallback to ImageMagick if pngquant fails
            convert "$input_file" -strip -quality 85 "$output_file"
        }
    else
        # Use ImageMagick
        convert "$input_file" -strip -quality 85 "$output_file"
    fi
    
    local new_size=$(get_file_size "$output_file")
    if [ "$original_size" -gt 0 ]; then
        local reduction=$(( (original_size - new_size) * 100 / original_size ))
        echo -e "  ${GREEN}✓ Saved: $(numfmt --to=iec-i --suffix=B $original_size) → $(numfmt --to=iec-i --suffix=B $new_size) (${reduction}% reduction)${NC}"
    fi
}

# Function to optimize JPG files
optimize_jpg() {
    local input_file="$1"
    local output_file="$2"
    local original_size=$(get_file_size "$input_file")
    
    echo -e "  Processing: ${input_file}"
    
    # Use ImageMagick to optimize JPG
    convert "$input_file" -strip -quality "$QUALITY" -sampling-factor 4:2:0 -interlace Plane "$output_file"
    
    local new_size=$(get_file_size "$output_file")
    if [ "$original_size" -gt 0 ]; then
        local reduction=$(( (original_size - new_size) * 100 / original_size ))
        echo -e "  ${GREEN}✓ Saved: $(numfmt --to=iec-i --suffix=B $original_size) → $(numfmt --to=iec-i --suffix=B $new_size) (${reduction}% reduction)${NC}"
    fi
}

# Optimize root PNG files
echo -e "\n${BLUE}Optimizing root directory PNG files...${NC}"
shopt -s nullglob
for file in *.png *.PNG; do
    if [ -f "$file" ]; then
        optimize_png "$file" "$OUTPUT_DIR/$file"
    fi
done
shopt -u nullglob

# Optimize assets/*.png files
echo -e "\n${BLUE}Optimizing assets directory...${NC}"
if [ -d "assets" ]; then
    shopt -s nullglob
    for file in assets/*.png assets/*.PNG; do
        if [ -f "$file" ]; then
            optimize_png "$file" "$OUTPUT_DIR/$file"
        fi
    done
    shopt -u nullglob
fi

# Optimize maps directory (both PNG and JPG)
echo -e "\n${BLUE}Optimizing maps directory...${NC}"
if [ -d "maps" ]; then
    # Process PNG files
    shopt -s nullglob
    for file in maps/*.png maps/*.PNG; do
        if [ -f "$file" ]; then
            optimize_png "$file" "$OUTPUT_DIR/$file"
        fi
    done
    
    # Process JPG files
    for file in maps/*.jpg maps/*.JPG maps/*.jpeg maps/*.JPEG; do
        if [ -f "$file" ]; then
            optimize_jpg "$file" "$OUTPUT_DIR/$file"
        fi
    done
    shopt -u nullglob
fi

# Calculate total savings
echo -e "\n${BLUE}========================================${NC}"
echo -e "${GREEN}Optimization complete!${NC}"
echo -e "${BLUE}========================================${NC}"
echo -e "Optimized files are in: ${YELLOW}$OUTPUT_DIR/${NC}"
echo -e "\n${YELLOW}Note: Original files are preserved unchanged.${NC}"
echo ""

# Calculate total size comparison
original_total=0
optimized_total=0

# Calculate original size
shopt -s nullglob
for file in *.png *.PNG assets/*.png assets/*.PNG maps/*.png maps/*.PNG maps/*.jpg maps/*.JPG maps/*.jpeg maps/*.JPEG; do
    if [ -f "$file" ]; then
        size=$(get_file_size "$file")
        original_total=$((original_total + size))
    fi
done

# Calculate optimized size
for file in "$OUTPUT_DIR"/*.png "$OUTPUT_DIR"/*.PNG "$OUTPUT_DIR"/assets/*.png "$OUTPUT_DIR"/assets/*.PNG "$OUTPUT_DIR"/maps/*.png "$OUTPUT_DIR"/maps/*.PNG "$OUTPUT_DIR"/maps/*.jpg "$OUTPUT_DIR"/maps/*.JPG "$OUTPUT_DIR"/maps/*.jpeg "$OUTPUT_DIR"/maps/*.JPEG; do
    if [ -f "$file" ]; then
        size=$(get_file_size "$file")
        optimized_total=$((optimized_total + size))
    fi
done
shopt -u nullglob

if [ $original_total -gt 0 ] && [ $optimized_total -ge 0 ]; then
    total_reduction=$(( (original_total - optimized_total) * 100 / original_total ))
    echo -e "Total original size:  $(numfmt --to=iec-i --suffix=B $original_total)"
    echo -e "Total optimized size: $(numfmt --to=iec-i --suffix=B $optimized_total)"
    echo -e "${GREEN}Total reduction: ${total_reduction}%${NC}"
fi

echo ""
