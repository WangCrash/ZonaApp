protocol MainPresenter: Presenter {
	func presentSearchView()
}

class DefaultMainPresenter: MainPresenter {
	func presentSearchView() {}
}
