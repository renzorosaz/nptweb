
# Nombre del subdirectorio en GitHub Pages
FOLDER_NAME="nptweb"

echo "✅ Building Flutter web..."
flutter build web

echo "🔧 Setting correct base href..."
sed -i 's|<base href="/">|<base href="/'"$FOLDER_NAME"'/">|' build/web/index.html

echo "🚀 Deploying to gh-pages..."
# Asegúrate de tener gh-pages instalado: npm install -g gh-pages
gh-pages -d build/web

echo "🎉 Deployment complete! Your site should be live at:"
echo "https://renzorosaz.github.io/$FOLDER_NAME/"
