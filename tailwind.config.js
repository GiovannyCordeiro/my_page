module.exports = {
  content: [
    './_drafts/**/*.html',
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.md',
    './*.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        'Prosto-Sans': ['Prosto-Sans', 'sans-serif'],
        'Prosto-Sans-Bold': ['Prosto-Sans-Bold', 'sans-serif'],
        'Prosto-Sans-Black': ['Prosto-Sans-Black', 'sans-serif'],
        'Prosto-Sans-italic': ['Prosto-Sans-italic', 'sans-serif'],
      }
    },
  },
  plugins: []
}
