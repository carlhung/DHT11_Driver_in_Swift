import XCTest
import SwiftyGPIO
@testable import DHT11

final class DHT11Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //        XCTAssertEqual(DHT11().text, "Hello, World!")
        let gpios = SwiftyGPIO.GPIOs(for: SupportedBoard.RaspberryPiPlusZero)
        let dht11 = DHT11(pin: gpios[.P18]!, for: .dht11)
        //        let dht11 = DHT11(supportedBoard: SupportedBoard.RaspberryPiPlusZero, gpioName: GPIOName.P18)!
        while (true) {
            do {
                let (temperature,humidity) = try dht11.read() // dht11.read(true)
                print("\n\n\n")
                print("DHT11 Raspberry Pi with Swift \n")
                print("Temperatura: \(temperature)  Humidate: \(humidity)")
                print("\n\n\n")
            } catch (DHTError.invalidNumberOfPulses) {
                let errorMessage = "INVALID PULSES"
                print(errorMessage)
            } catch (DHTError.invalidChecksum) {
                let errorMessage = "INVALID CHECKSUM"
                print(errorMessage)
            } catch {
                print("unknown error")
            }
            
//            sleep(1)
        }
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
