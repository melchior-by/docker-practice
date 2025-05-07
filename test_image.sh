#!/bin/bash
set -e

echo "🔧 Building image..."
./build_image.sh

echo "🚀 Running container to generate output..."
docker run --rm -v "$PWD":/app converter-image

echo "✅ Verifying if example.json was generated..."
if [ -f "example.json" ]; then
    echo "✅ Test PASSED: example.json was created."
    cat example.json
else
    echo "❌ Test FAILED: example.json was not created."
    exit 1
fi