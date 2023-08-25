document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) { showProgressLine(progressBar) }
})

function showProgressLine(progressBar) {
  var questionsCount = progressBar.dataset.questionsCount
  var currentQuestionNumber = progressBar.dataset.currentQuestionNumber
  var progressLine = document.querySelector('.progress-bar-line')
  var progressPercentage = ((currentQuestionNumber - 1) / questionsCount) * 100

  progressLine.style.width = progressPercentage + '%'
  progressLine.textContent = progressPercentage + '%'
}
