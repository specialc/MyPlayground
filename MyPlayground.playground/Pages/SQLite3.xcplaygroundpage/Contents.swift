//: [Previous](@previous)

import Foundation
import SQLite3

class Goods {
    let Name: String!
    let HeadPath: String!
    let Sex: String!
    let Birthday: String!
    let Address: String!
    
    
    
    init(name: String, headPath: String, sex: String, birthday: String, address: String) {
        self.Name = name
        self.HeadPath = headPath
        self.Sex = sex
        self.Birthday = birthday
        self.Address = address
    }
}
let aaa_userModel = Goods(name:"张三", headPath:"路径", sex:"男", birthday:"2019", address:"上海市")
var aaa_userArray = [Goods]()
var aaa_theDBPath = ""
var aaa_theDB: OpaquePointer?


func createData() {
    for index in 0...4 {
        let goods = Goods(name: "computer" + "\(index)", headPath:"路径", sex: "男", birthday: "2019-1-1", address: "上海市")
        aaa_userArray.append(goods)
    }
}
/// 修改数据库存放路径
func fetchLibraryPath() {
    if let libraryPathString = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first {
        let pathURL = URL(fileURLWithPath: libraryPathString).appendingPathComponent("goods.sqlite")
        aaa_theDBPath = pathURL.path
    }
}
// 创建并连接数据库
func openDatabase() -> OpaquePointer? {
    var aaa_aNewDB: OpaquePointer?
    if sqlite3_open(aaa_theDBPath, &aaa_aNewDB) == SQLITE_OK {
        print("成功打开数据库，路径：\(aaa_theDBPath)")
        return aaa_aNewDB
    } else {
        print("打开数据库失败")
        return nil
    }
}
/*
 通过上面的代码我们可以看到，首先声明了一个OpaquePointer类型的可选值db，接下来调用了sqlite3_open()方法，该方法的作用是：如果之前创建了数据库那么直接打开，若没创建会直接创建一个。如果该方法调用成功，他会返回一个OpaquePointer的值赋值给你传递进去的db。
 SQLITE_OK是一个定义在SQLite库中的一个常量，它代表一个Int32的0。SQLite的大多数函数都会返回一个Int32的值，例如SQLITE_ROW (100)、SQLITE_DONE (101)等，详细列表你可以查看这里。
 现在你可以通过调用db = openDatabase()来打开或者创建一个数据库了，正常情况下你会看见成功打开数据库，路径：xxx/xxx.sqlite的输出。
 现在，我们已经成功的创建了一个名字为goods.sqlite的数据库了，接下来我们要做的就是创建一个表了。
 */


// 创建表
func createTable() {
    let createTableString = """
                            CREATE TABLE Computer(
                            Id INT PRIMARY KEY NOT NULL,
                            Name CHAR(255),
                            HeadPath CHAR(255),
                            Sex CHAR(255),
                            Birthday CHAR(255),
                            Address CHAR(255));
                            """
    
//    let createTableString = """
//                            CREATE TABLE IF NOT EXISTS Computer(
//                            Id INT PRIMARY KEY NOT NULL,
//                            Name CHAR(255),
//                            HeadPath CHAR(255),
//                            HeadImage BLOB);
//                            """
    
    var createTableStatement: OpaquePointer?
    // 第一步
    if sqlite3_prepare_v2(aaa_theDB, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
        // 第二步
        if sqlite3_step(createTableStatement) == SQLITE_DONE {
            print("成功创建表")
        } else {
            print("未成功创建表")
        }
    }
    else {
        print("创建表：准备失败")
    }
    //第三步
    sqlite3_finalize(createTableStatement)
}
/*
 首先解释一下createTableString:创建一个名字为Computer的表，Id为主键且不为空，Name不超过255个字符，Weight为Int类型，Price为Float类型。
 然后创建了一个OpaquePointer?类型的变量用于下面的函数：sqlite3_prepare_v2()。

 第一步：该函数会将createTableString编译为字节代码（byte code）并返回一个status code，这个函数执行成功则表明database已经准备好了执行任意的SQL statement（就是创建的SQL的字符串），该函数执行成功后即会执行sqlite3_step()。
 第二步：sqlite3_step()用来执行编译完成的statement handle(createTableStatement)并返回一个status code。
 第三步：在你每一次的操作完成后你必须调用sqlite3_finalize()去删除你的statement以避免resource leak。注意：一旦一个statement被finalized，你不应该再一次使用它。
 */


// 插入一条数据
func insertOneData() {
    let insertRowString = "INSERT INTO Computer(Id, Name, HeadPath, Sex, Birthday, Address) VALUES (?, ?, ?, ?, ?, ?);"
    var insertStatement: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, insertRowString, -1, &insertStatement, nil) == SQLITE_OK {
        let id: Int32 = 1
        //第二步
        sqlite3_bind_int(insertStatement, 1, id)
        sqlite3_bind_text(insertStatement, 2, (aaa_userModel.Name as NSString).utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 3, (aaa_userModel.HeadPath as NSString).utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 4, (aaa_userModel.Sex as NSString).utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 5, (aaa_userModel.Birthday as NSString).utf8String, -1, nil)
        sqlite3_bind_text(insertStatement, 6, (aaa_userModel.Address as NSString).utf8String, -1, nil)
        
        //第三步
        if sqlite3_step(insertStatement) == SQLITE_DONE {
            print("插入一条数据成功")
        } else {
            print("插入一条数据失败")
        }
    }
    else {
        print("插入一条数据：准备失败")
    }
    //第四步
    sqlite3_finalize(insertStatement)
}
/*
 insertRowString中的?和前面的字段是对应的，它只是占位符的意思，告诉编译器当真正执行该语句的时候会插入相应的值。
 第二步：sqlite3_bind_int()标识你绑定了一个Int类型的值，该函数的第一个参数是你的statement(即insertStatement)，第二个参数是?的位置在你的statement(注意该值是非零的)，在此处也就是1，第三个参数为你想绑定的值。sqlite3_bind_text()函数表示你绑定的是一个text（一般用于比较长的字符串）类型值，该函数比sqlite3_bind_int()多了额外的两个参数，第四个参数的意思是text的字节数，一般穿-1,第五个参数是一个closure回调，处理完string后调用。
 第三步第四步同上
 */


// 插入多条数据
func insertMutipleData() {
    let insertRowString = "INSERT INTO Computer (Id, Name, HeadPath, Sex, Birthday, Address) VALUES (?, ?, ?, ?, ?, ?);"
    var insertStatement: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, insertRowString, -1, &insertStatement, nil) == SQLITE_OK {
        for (index, good) in aaa_userArray.enumerated() {
            let id: Int32 = Int32(index + 1)
            //第二步
            // ID
            sqlite3_bind_int(insertStatement, 1, id)
            // 姓名
            sqlite3_bind_text(insertStatement, 2, good.Name, -1, nil)
            // 头像
            sqlite3_bind_text(insertStatement, 3, good.HeadPath, -1, nil)
            // 性别
            sqlite3_bind_text(insertStatement, 4, good.Sex, -1, nil)
            // 生日
            sqlite3_bind_text(insertStatement, 5, good.Birthday, -1, nil)
            // 地址
            sqlite3_bind_text(insertStatement, 6, good.Address, -1, nil)
            
            //第三步
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("插入多条数据成功")
            } else {
                print("插入多条数据失败")
            }
            //第四步
            sqlite3_reset(insertStatement)
        }
    }
    else {
        print("插入多条数据：准备失败")
    }
    //第五步
    sqlite3_finalize(insertStatement)
}
/*
 insertRowString同上。
 第四步：调用sqlite3_reset()函数，以便下次循环再次执行insertStatement
 第一步、第二步、第三步、第五步同上。
 */


// 更新数据
func updateData() {
    let updateString = "UPDATE Computer SET Name = 'changeComputer' WHERE Id = 2;"
    var updateDB: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, updateString, -1, &updateDB, nil) == SQLITE_OK {
        //第二步
        if sqlite3_step(updateDB) == SQLITE_DONE {
            print("更新成功")
        } else {
            print("更新失败")
        }
    }
    else {
        print("更新数据：准备失败")
    }
    //第三步
    sqlite3_finalize(updateDB)
}
/*
 updateString：将Id==2的数据的Name字段改为changeComputer。
 sqlite3_prepare_v2()：准备，sqlite3_step()：执行更新statement，sqlite3_finalize()：结束。
 */


// 删除数据
func deleteData() {
    let deleteString = "DELETE FROM Computer WHERE Id = 2;"
    var deleteDB: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, deleteString, -1, &deleteDB, nil) == SQLITE_OK {
        //第二步
        if sqlite3_step(deleteDB) == SQLITE_DONE {
            print("删除成功")
        }
        else {
            print("删除失败")
        }
    }
    else {
        print("删除数据：准备失败")
    }
    //第三步
    sqlite3_finalize(deleteDB)
}
/*
 deleteString：删除表中Id==2的数据。
 sqlite3_prepare_v2()：准备，sqlite3_step()：执行删除statement，sqlite3_finalize()：结束。
 */


// 查询一条数据
func queryOneData() {
    let queryString = "SELECT * FROM Computer WHERE Id == 1;"
    var queryDB: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, queryString, -1, &queryDB, nil) == SQLITE_OK {
        //第二步
        if sqlite3_step(queryDB) == SQLITE_ROW {
            //第三步
            let id = sqlite3_column_int(queryDB, 0)
            let name = String(cString: sqlite3_column_text(queryDB, 1)!)
            let headPath = String(cString: sqlite3_column_text(queryDB, 2)!)
            let sex = String(cString: sqlite3_column_text(queryDB, 3)!)
            let birthday = String(cString: sqlite3_column_text(queryDB, 4)!)
            let address = String(cString: sqlite3_column_text(queryDB, 5)!)
            
            print("查询一条数据成功：" + "id: \(id), name: \(name), headPath: \(headPath), sex: \(sex), birthday: \(birthday), address: \(address)")
        } else {
            print("查询一条数据失败")
        }
    }
    else {
        print("查询一条数据：准备失败")
    }
    //第四步
    sqlite3_finalize(queryDB)
}
/*
 queryString：在Computer表中查找所有Id == 2的数据。
 第二步：注意此时要判断的status code为SQLITE_ROW，如果该判断为true则代表你查询的数据存在在表里。
 第三步：sqlite3_column_int()函数是按照列数取数据，第一个参数是statement，第二个参数则是该字段是第几列(Id 为表里的第一列，从0开始计算)。sqlite3_column_text()要略微复杂一点，他需要转换类型通过String(cString: queryResultName!)。
 第一步、第四步同上
 */


// 查询多条数据
func queryAllData() {
    let queryString = "SELECT * FROM Computer;"
    var queryDB: OpaquePointer?
    //第一步
    if sqlite3_prepare_v2(aaa_theDB, queryString, -1, &queryDB, nil) == SQLITE_OK {
        //第二步
        while(sqlite3_step(queryDB) == SQLITE_ROW) {
            //第三步
            let id = sqlite3_column_int(queryDB, 0)
            let queryResultName = sqlite3_column_text(queryDB, 1)
            let name = String(cString: queryResultName!)
            let queryResultHeadPath = sqlite3_column_text(queryDB, 2)
            let headPath = String(cString: queryResultHeadPath!)
            let queryResultSex = sqlite3_column_text(queryDB, 3)
            let sex = String(cString: queryResultSex!)
            let queryResultBirthday = sqlite3_column_text(queryDB, 4)
            let birthday = String(cString: queryResultBirthday!)
            let queryResultAddress = sqlite3_column_text(queryDB, 5)
            let address = String(cString: queryResultAddress!)
            
            print("查询成功：" + "id: \(id), name: \(name), headPath: \(headPath), sex: \(sex), birthday: \(birthday), address: \(address)")
        }
    }
    else {
        print("查询多条数据：准备失败")
    }
    //第四步
    sqlite3_finalize(queryDB)
}
/*
 第二步：此处为while循环，当查询到最后一行时会返回SQLITE_DONE状态码来结束。
 第一步第三步第四步同上。
 */






//: [Next](@next)
