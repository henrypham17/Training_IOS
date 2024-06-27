import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // them cac gesture recognizers
        // cu chi di chuyen xquanh man hinh
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
               blueView.addGestureRecognizer(panGesture)
        
        // cu chi zoom
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        blueView.addGestureRecognizer(pinchGesture)
        
        // cu chi xoay chum
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        blueView.addGestureRecognizer(rotationGesture)
    }
    
    // ham xu li cu chi
    @objc func handlePan(_ gesture: UIPanGestureRecognizer){
        let dichuyen = gesture.translation(in: view)
        if let viewToMove = gesture.view {
            viewToMove.center = CGPoint(x: viewToMove.center.x + dichuyen.x, y: viewToMove.center.y + dichuyen.y)
            gesture.setTranslation(CGPoint.zero, in: view)
        }
    }
    
    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer){
        if let viewToZoom = gesture.view {
            viewToZoom.transform = viewToZoom.transform.scaledBy(x: gesture.scale, y: gesture.scale)
            gesture.scale = 1
        }
    }
    
    @objc func handleRotation(_ gesture: UIRotationGestureRecognizer){
        if let viewToRotation = gesture.view {
            viewToRotation.transform = viewToRotation.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        }
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let alert = UIAlertController(title: "Xác nhận", message: "Bạn có muốn thêm mới View", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Đồng ý", style: .default){ [self] _ in
            let newView = UIView(frame: CGRect(x: 132, y: 227, width: 128, height: 128))
            newView.backgroundColor = .blue
            newView.isUserInteractionEnabled = true
            
            // them cac gesture recognizers
            // cu chi di chuyen xquanh man hinh
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
                   newView.addGestureRecognizer(panGesture)
            
            // cu chi zoom
            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
            newView.addGestureRecognizer(pinchGesture)
            
            // cu chi xoay chum
            let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
            newView.addGestureRecognizer(rotationGesture)
            
            self.view.addSubview(newView)
        }
        
        let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let alert = UIAlertController(title: "Xác nhận", message: "Bạn có muốn xoá View không?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Đồng ý", style: .destructive){ _ in self.blueView.removeFromSuperview()}
        
        let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
