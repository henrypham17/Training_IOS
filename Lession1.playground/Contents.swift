import Foundation

// Xay dung lop BenhNhan
class Patient {
    var name: String
    var address: String
    var birthYear: Int
    
    init(name: String, address: String, birthYear: Int) {
        self.name = name
        self.address = address
        self.birthYear = birthYear
    }
    
    func input(){
        print("Nhap ho ten: ", terminator: "")
        self.name = readLine() ?? ""
        
        print("Nhap dia chi: ", terminator: "")
        self.address = readLine() ?? ""
        
        print("Nhap nam sinh: ", terminator: "")
        self.birthYear = Int(readLine() ?? "") ?? 0
    }
    
    func output(){
        print("Name: \(name), Adress: \(address), BirthYear: \(birthYear)")
    }
}

// Xay dung lop BenhAn
class HealthRecord : Patient {
    var recordName: String
    var hospitalFee: Double
    
    init(name: String, address: String, birthYear: Int, recordName: String, hospitalFee: Double) {
        self.recordName = recordName
        self.hospitalFee = hospitalFee
        super.init(name: name, address: address, birthYear: birthYear)
    }
    
    override func input(){
        super.input()
        
        print("Nhap ten benh an: ", terminator: "")
        self.recordName = readLine() ?? ""
        
        print("Nhap so tien vien phi: ", terminator: "")
        self.hospitalFee = Double(readLine() ?? "") ?? 0.0
    }
    
    override func output() {
        super.output()
        print("RecordName: \(recordName), HospitalFee: \(hospitalFee)")
    }
    
    func currentAge() -> Int {
        return Calendar.current.component(.year, from: Date()) - birthYear
    }
}

func main() {
    print("Nhap so benh an: ", terminator: "")
    var n = Int(readLine() ?? "") ?? 0
    
    var healthRecord : [HealthRecord] = []
    
    for _ in 0..<n {
        let record = HealthRecord(name: "", address: "", birthYear: 0, recordName: "", hospitalFee: 0)
        record.input()
        healthRecord.append(record)
    }
    
    // sxep danh sach theo tuoi giam dan cua benh nhan
    print("Danh sach giam dan theo tuoi: \n")
    healthRecord.sort {
        $0.currentAge() > $1.currentAge()
    }
    
    // danh sach benh nhan co tuoi <= 10
    print("Danh sach cac benh nhan co tuoi <= 10: \n")
    for age in healthRecord {
        if age.currentAge() <= 10{
            age.output()
        }
    }
    
    // Thong tin benh nhan co vien phi cao nhat
    print("Thong tin benh nhan co vien phi cao nhat: \n")
    if var money = healthRecord.max(by: {$0.hospitalFee < $1.hospitalFee}){
        money.output()
    }
}

main()
