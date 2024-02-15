import UIKit

class ViewController: UIViewController {

    var pageViewController: UIPageViewController!
    var pages = [UIViewController]()
    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        isSelfShow()
    }
    
    func isSelfShow() {
        let hasVisitedMainMenu = UserDefaults.standard.bool(forKey: "hasVisitedMainMenu")
        if hasVisitedMainMenu {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            
            
            let vc = storyboard.instantiateViewController(withIdentifier: "New") as! NewDesignViewController
            navigationController?.pushViewController(vc, animated: false)
            
            
//            let vc = storyboard.instantiateViewController(withIdentifier: "Second") as! MainMenuViewController
//            navigationController?.pushViewController(vc, animated: true)

        } else {
            setupPageViewController()
            setupPageControl()
        }
    }

    func setupPageViewController() {

        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)

        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)


        let page1 = createPageController("Page 1", color: .systemGray6)
        let page2 = createPageController("Page 2", color: .systemGray6)
        let page3 = createPageController("Page 3", color: .systemGray6)

        pages = [page1, page2, page3]

        pageViewController.setViewControllers([page1], direction: .forward, animated: true, completion: nil)

        pageViewController.dataSource = self
        pageViewController.delegate = self
    }

    func createPageController(_ title: String, color: UIColor) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor(named: "bacColor")
        
        if title == "Page 1" {
            
            let label = UILabel()
            label.text = "Добро пожаловать!"
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            label.textColor = UIColor(named: "labelColors")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 3 
            viewController.view.addSubview(label)
            label.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 550).isActive = true
            label.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            let label2 = UILabel()
            label2.text = "Приложение упрощает поиск нужного кабинета в университете"
            label2.font = UIFont.systemFont(ofSize: 18, weight: .light)
            label2.textColor = UIColor(named: "labelColors")
            label2.translatesAutoresizingMaskIntoConstraints = false
            label2.numberOfLines = 3
            viewController.view.addSubview(label2)
            label2.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
            label2.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "1.png")
            viewController.view.addSubview(imageView)
            //imageView.frame = CGRect(x: 20, y: 160, width: 360, height: 360)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 360).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 360).isActive = true
            imageView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 160).isActive = true

        }
        
        if title == "Page 2" {
            
            let label = UILabel()
            label.text = "Теперь легко найти нужную аудиторию"
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            label.textColor = UIColor(named: "labelColors")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 3
            viewController.view.addSubview(label)
            label.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 550).isActive = true
            label.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            let label2 = UILabel()
            label2.text = "Используйте приложение для быстрого поиска маршрута к кабинету"
            label2.font = UIFont.systemFont(ofSize: 18, weight: .light)
            label2.textColor = UIColor(named: "labelColors")
            label2.translatesAutoresizingMaskIntoConstraints = false
            label2.numberOfLines = 3
            viewController.view.addSubview(label2)
            label2.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
            label2.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "2.png")
            viewController.view.addSubview(imageView)
            //imageView.backgroundColor = .red
            //imageView.frame = CGRect(x: 10, y: 160, width: 370, height: 320)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 370).isActive = true
            imageView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 160).isActive = true
        }
        
        if title == "Page 3" {
            
            let label = UILabel()
            label.text = "Давай начинать?"
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            label.textColor = UIColor(named: "labelColors")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 3
            viewController.view.addSubview(label)
           
            
            let label2 = UILabel()
            label2.text = "Укажи номер аудитории и этаж как в расписании на следующей странице. Не забудь указать корпус и место, где ты заходишь в универ при необходимости 🏫"
            label2.font = UIFont.systemFont(ofSize: 18, weight: .light)
            label2.textColor = UIColor(named: "labelColors")
            label2.translatesAutoresizingMaskIntoConstraints = false
            label2.numberOfLines = 5
            viewController.view.addSubview(label2)
            
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: "3.png")
            viewController.view.addSubview(imageView)
            //imageView.frame = CGRect(x: 20, y: 160, width: 360, height: 360)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 360).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 360).isActive = true
            imageView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 10).isActive = true
            imageView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: 80).isActive = true
            
            label2.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label2.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
            label2.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            let button = UIButton()
            button.setTitle("Начнем", for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 26, weight: .light)
            
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 20
            viewController.view.addSubview(button)
           // button.frame = CGRect(x: 20, y: 720, width: 370, height: 60)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: -85).isActive = true
            button.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            button.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -30).isActive = true
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            label.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 30).isActive = true
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10).isActive = true
            label.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: -50).isActive = true
            
            
            button.isUserInteractionEnabled = true
            button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

        }
        
        return viewController
    }
    
    @objc func nextPage() {
      
        UserDefaults.standard.set(true, forKey: "hasVisitedMainMenu")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "New") as! NewDesignViewController
        navigationController?.pushViewController(vc, animated: true)
        print(1)
    }
    
    
    func setupPageControl() {
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(pageControl)

            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true

            pageControl.numberOfPages = pages.count
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = .systemGray
            pageControl.currentPageIndicatorTintColor = .systemBlue
        }
}

extension ViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex > 0 {
            return pages[currentIndex - 1]
        } else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let viewControllers = pageViewController.viewControllers,
              let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }

        pageControl.currentPage = currentIndex
    }
}


extension ViewController {
    @objc func pageControlTapped(_ sender: UIPageControl) {
        guard let currentViewController = pageViewController.viewControllers?.first,
              let currentIndex = pages.firstIndex(of: currentViewController) else { return }

        let tappedIndex = sender.currentPage

        if tappedIndex < currentIndex {
            pageViewController.setViewControllers([pages[tappedIndex]], direction: .reverse, animated: true, completion: nil)
        } else if tappedIndex > currentIndex {
            pageViewController.setViewControllers([pages[tappedIndex]], direction: .forward, animated: true, completion: nil)
        }
    }
}



