const user = {
  _role: 'user',
  set role(arg) { if (arg === 'admin') { this._role = arg } },
  get role() { return this._role },
  isAdmin() { return this._role === 'admin' ? true : false },
}

document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  var controlAdmin = document.querySelector('.sort-by-title-admin')

  if (control) { control.addEventListener('click', sortRowsByTitle) }

  if (controlAdmin) {
    user.role = 'admin'
    controlAdmin.addEventListener('click', sortRowsByTitle)
  }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // Nodelist
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')
  sortedTable.classList.add('table', 'table-bordered')

  if (user.isAdmin()) { sortedTable.classList.add('border-dark') }
  if (!user.isAdmin()) { sortedTable.classList.add('table-striped') }

  var sortedTableHeader = sortedTable.createTHead()

  if (!user.isAdmin()) { sortedTableHeader.classList.add('table-dark') }

  sortedTableHeader.appendChild(rows[0])

  var sortedTableBody = sortedTable.createTBody()

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTableBody.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
