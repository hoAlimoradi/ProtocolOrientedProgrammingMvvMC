//
//  CustomNavigationBar.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//

import UIKit

open class CustomNavigationBar: UINavigationBar {

    enum Contants {
        static let titleHuggingPriority: Float = 501
        static let titleCompressionResistancePriority: Float = 748
        static let spacerHuggingPriority: Float = 248
        static let spacerCompressionResistancePriority: Float = 740
        static let titleIconWidth = 18
        static let titleIconHeight = 18
        static let barButtonSize = 40
        static let barButtonMargin = 8
        static let barButtonToViewMargin = 16
        static let titleViewDefaultHeight: CGFloat = 40
        static let titleViewSpacing: CGFloat = 8
    }

    var titleView: UIView?

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setDefaultStyle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setDefaultStyle()
    }

    open func setDefaultStyle(navBarColor: UIColor = .white, tintColor: UIColor = UIColor(named: "color_dark")!) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = navBarColor
        appearance.shadowColor = .clear
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        self.tintColor = tintColor
        barTintColor = navBarColor
    }

}

extension UIViewController {

    var leftButtonsSpace: Int {
        let leftButtons = navigationItem.leftBarButtonItems?.count ?? 0
        return leftButtons * CustomNavigationBar.Contants.barButtonSize + (leftButtons * CustomNavigationBar.Contants.barButtonMargin) + CustomNavigationBar.Contants.barButtonToViewMargin
    }

    var rightButtonsSpace: Int {
        let rightButtons = navigationItem.rightBarButtonItems?.count ?? 0
        return rightButtons * CustomNavigationBar.Contants.barButtonSize + (rightButtons * CustomNavigationBar.Contants.barButtonMargin) + CustomNavigationBar.Contants.barButtonToViewMargin
    }

    public func getNavigationBar() -> CustomNavigationBar? {
        return navigationController?.navigationBar as? CustomNavigationBar
    }

    public func setNavigationLeftTitle(_ title: String, icon: UIImage? = nil, font: UIFont? = nil) {
        getNavigationBar()?.titleView?.removeFromSuperview()
        getNavigationBar()?.titleView = makeTitleView(title: title, icon: icon, font: font ?? Fonts.MontserratBold20)
        getNavigationBar()?.addSubview(getNavigationBar()?.titleView ?? UIView())
    }
    public func setNavigationLeftTitlesWithTouchCallBack(_ title: String,
                                                       icon: UIImage? = nil,
                                                       font: UIFont? = nil,
                                                       touched: (() -> Void)? = nil) {
        getNavigationBar()?.titleView?.removeFromSuperview()
        getNavigationBar()?.titleView = makeTitleView(title: title,
                                                      icon: icon,
                                                      font: font ?? Fonts.MontserratBold20,
                                                      touched: touched)
        getNavigationBar()?.addSubview(getNavigationBar()?.titleView ?? UIView())
    }
    public func setNavigationLeftTitles(_ titles: [(String, UIFont?)], icon: UIImage? = nil) {
        getNavigationBar()?.titleView?.removeFromSuperview()
        getNavigationBar()?.titleView = makeTitleView(titles: titles, icon: icon)
        getNavigationBar()?.addSubview(getNavigationBar()?.titleView ?? UIView())
    }
    public func setNavigationLeftTitleWithBack(_ title: String, backButtonImage: UIImage? = UIImage(named: "iconArrowLeft"), titleIcon: UIImage? = nil, font: UIFont? = nil) {
        let button = UIButton(frame: CGRect(x: 0, y: 0,
                                            width: CustomNavigationBar.Contants.barButtonSize,
                                            height: CustomNavigationBar.Contants.barButtonSize))
        button.setImage(backButtonImage, for: .normal)
        button.imageView?.tintColor = getNavigationBar()?.tintColor
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backButton = UIBarButtonItem(customView: button)
        navigationItem.setLeftBarButton(backButton, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        setNavigationLeftTitle(title, icon: titleIcon, font: font ?? Fonts.MontserratBold20)
    }

    private func makeTitleView(title: String,
                               icon: UIImage? = nil,
                               font: UIFont,
                               touched: (() -> Void)? = nil) -> UIView {
        return makeTitleView(titles: [(title, font)],
                             icon: icon,
                             touched: touched)
    }
    private func makeTitleView(titles: [(String, UIFont?)],
                               icon: UIImage? = nil,
                               touched: (() -> Void)? = nil) -> UIView {
        var titleLabels = [UILabel]()
        for (title, font) in titles {
            let titleLabel = UILabel(frame: CGRect.zero)
            titleLabel.font = font ?? Fonts.MontserratBold20
            titleLabel.textColor = getNavigationBar()?.tintColor
            titleLabel.text = title
            titleLabel.setContentHuggingPriority(UILayoutPriority(CustomNavigationBar.Contants.titleHuggingPriority), for: .horizontal)
            titleLabel.setContentCompressionResistancePriority(UILayoutPriority(CustomNavigationBar.Contants.titleCompressionResistancePriority), for: .horizontal)
            titleLabel.setOnTapped { [touched] in
                touched?()
            }

            titleLabels.append(titleLabel)
        }

        let iconView = UIImageView(frame: CGRect(x: 0, y: 0,
                                                 width: CustomNavigationBar.Contants.titleIconWidth,
                                                 height: CustomNavigationBar.Contants.titleIconHeight))
        iconView.image = icon
        iconView.contentMode = .scaleAspectFill
        let spacer = UIView()
        spacer.setContentHuggingPriority(UILayoutPriority(CustomNavigationBar.Contants.spacerHuggingPriority),
                                         for: .horizontal)
        spacer.setContentCompressionResistancePriority(UILayoutPriority(CustomNavigationBar.Contants.spacerCompressionResistancePriority),
                                                       for: .horizontal)

        let hStack = UIStackView(arrangedSubviews: titleLabels + [iconView, spacer])
        hStack.frame = CGRect(x: leftButtonsSpace, y: 0,
                              width: Int(UIScreen.main.bounds.width) - (leftButtonsSpace + rightButtonsSpace),
                              height: Int(getNavigationBar()?.bounds.height ?? CustomNavigationBar.Contants.titleViewDefaultHeight))
        hStack.spacing = CustomNavigationBar.Contants.titleViewSpacing
        hStack.alignment = .center
        hStack.distribution = .fill
        return hStack
    }

    public func removeTitleView() {
        getNavigationBar()?.titleView?.removeFromSuperview()
    }

    public func addTitleView() {
        getNavigationBar()?.addSubview(getNavigationBar()?.titleView ?? UIView())
    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}



