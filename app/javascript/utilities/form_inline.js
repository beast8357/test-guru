document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHanlder)

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHanlder(resourceId)
  }
})

function formInlineLinkHanlder(event) {
  event.preventDefault()

  var testId = this.dataset.testId
  formInlineHanlder(testId)
}

function formInlineHanlder(testId) {
  var link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  var $testTitle = $(`.test-title[data-test-id="${testId}"]`)
  var $formInline = $(`.form-inline[data-test-id="${testId}"]`)

  if (!link) { return }

  $formInline.toggle()
  $testTitle.toggle()

  link.textContent = $formInline.is(':visible') ? translations.cancel : translations.edit
}
