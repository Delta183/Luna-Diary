//
//  ReviewEntry.swift
//  Luna-Diary
//
//  Created by Daniel Figueroa on 2022-12-15.
//

import SwiftUI

struct ReviewEntry: View {
    @EnvironmentObject var csController: ColourSchemeController
    @EnvironmentObject var diaryModelController : DiaryModelController
    @State var diaryEntry: DiaryModel
    @State private var readyToNavigate : Bool = false
    @State private var readyToNavigatePDF : Bool = false
    @State private var showingAlert = false

    // boolean for the confrimation dialog
    @State private var confirmationShown = false // Unused
    // boolean for review or creation mode
    // @State private var inReviewMode = false // Unused
    // Needed for dismissing view
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        
        NavigationStack{
            VStack {
               
                // header VStack
                VStack{
                    Color(hex: csController.headerColour)
                        .ignoresSafeArea(edges: .top)
                    // HStack displaying the date in full
                    HStack {
                        Text(diaryEntry.date, style: .date)
                            .font(Font.custom("MADEWaffleSlab", fixedSize: 16))
                            .foregroundColor(Color(hex: csController.headerItemColour))
                            .multilineTextAlignment(.leading)
                        Text(diaryEntry.date, style: .time)
                            .font(Font.custom("MADEWaffleSlab", fixedSize: 16))
                            .foregroundColor(Color(hex: csController.headerItemColour))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.leading, 6.0)
                    // This is how you pass information to objects
                    // Also formatting the passed date for only day, month and year
                    
                        ScrollView(.vertical) {
                            Text(diaryEntry.title)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(nil)
                                .font(Font.custom("MADEWaffleSlab", fixedSize: 20))
                                .foregroundColor(Color(hex: csController.headerItemColour))
                                .padding(.leading, 5.0)
                                .frame(
                                    minWidth: UIScreen.main.bounds.width,
                                    maxWidth: UIScreen.main.bounds.width,
                                    alignment: .leading)
                        }.offset(y:-15)
                        
                        // currentDateObject.date
            
                }.frame(width: UIScreen.main.bounds.width, height: 150)
                    .background(Color(hex: csController.headerColour))
                    .offset(y: 40)
                    .cornerRadius(15)
                    //  This is used to ignore the safe area on top of screen
                    .ignoresSafeArea(edges: .top)
                
                // TextEditor VStack begin
                VStack{
                    // Look into putting underlines on each line
                        ScrollView(.vertical) {
                            Text(diaryEntry.content)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(nil)
                                .foregroundColor(Color(hex: csController.entryTextColour))
                                .font(Font.custom("YanoneKaffeesatz-Light", fixedSize: 20))
                                .lineSpacing(2)
                                .padding(.horizontal, 8.0)
                                .frame(
                                    minWidth: UIScreen.main.bounds.width,
                                    maxWidth: UIScreen.main.bounds.width,
                                    alignment: .topLeading)
                        }
                        //Spacer()
                    
                }
                .offset( y:-90)
                // Button for exporting file into a PDF as one file
                VStack{
                    Text("Share").font(.system(size: 20).bold()).foregroundColor(Color(hex: csController.entryTextColour))
                    Button(action: {
                        // exportPDF(diaryEntry: diaryEntry)
                        createPdf(diaryEntry: diaryEntry)
                        showingAlert.toggle()
                        // readyToNavigatePDF.toggle()
                    }) {
                        // The rendering mode makes it so that the custom immage color can change
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color(hex: csController.entryTextColour))
                            .frame(width: 32.0, height: 36.0)
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("PDF Exported!"), dismissButton: .default(Text("OK")))
                    }.padding(.bottom, 10)
                    // .navigationDestination(isPresented: $readyToNavigatePDF) { EntryShareView(diaryEntry: diaryEntry)}
                }
                Spacer()
            }.background(Color(hex: csController.backgroundColour))
            // NavigationBar button placed below
            .navigationBarItems(trailing:
                HStack {
                    // Edit Button begin
                    Button(action: {
                        // function of button
                        readyToNavigate.toggle()
                        }) {
                            // appearance of button
                            Text("Edit")
                                .foregroundColor(.white)
                                .font(Font.custom("MADEWaffleSlab", fixedSize: 24))
                        }.navigationDestination(isPresented: $readyToNavigate){
                            UpdateEntry(diaryEntry: diaryEntry, originalEntry: diaryEntry)
                        }
                    // delete button begin
                    Button(action: {                       
                        confirmationShown.toggle()
                        // dismiss()
                        }){
                            Text("Delete").foregroundColor(.white).font(Font.custom("MADEWaffleSlab", fixedSize: 24))
                          }.confirmationDialog("Are you sure?",
                                          isPresented: $confirmationShown) {
                                          Button("Confirm Delete", role: .destructive) {
                                              // Perform deletion and dismiss view
                                              diaryModelController.deleteDiaryEntry(diaryEntry: diaryEntry)
                                              dismiss()
                                          }
                          }// delete button end
                }// Hstack end for nav buttons
               )
        }// Outer VStack
    } // NavigationStack end
}


// This function creates a PDF of however many pages are needed
func createPdf(diaryEntry: DiaryModel) {

    let outputFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("diaryEntry.pdf")
    let title = "\(diaryEntry.title)\n"
    let text =  "Written on \(getLongStringFromDate(date: diaryEntry.date))\n\n\(diaryEntry.content)\n"

    let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)]

    let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]

    let formattedTitle = NSMutableAttributedString(string: title, attributes: titleAttributes)
    let formattedText = NSAttributedString(string: text, attributes: textAttributes)
    formattedTitle.append(formattedText)

    // 1. Create Print Formatter with your text.

    let formatter = UISimpleTextPrintFormatter(attributedText: formattedTitle)

    // 2. Add formatter with pageRender

    let render = UIPrintPageRenderer()
    render.addPrintFormatter(formatter, startingAtPageAt: 0)

    // 3. Assign paperRect and printableRect

    let page = CGRect(x: 0, y: 0, width: 595.2, height: 810.8) // A4, 72 dpi
    // These insets seem to be responsible for the padding
    let printable = page.insetBy(dx: 20, dy: 20)

    render.setValue(NSValue(cgRect: page), forKey: "paperRect")
    render.setValue(NSValue(cgRect: printable), forKey: "printableRect")

    // 4. Create PDF context and draw
    let rect = CGRect.zero

    let pdfData = NSMutableData()
    UIGraphicsBeginPDFContextToData(pdfData, rect, nil)

    for i in 1...render.numberOfPages {

        UIGraphicsBeginPDFPage();
        let bounds = UIGraphicsGetPDFContextBounds()
        render.drawPage(at: i - 1, in: bounds)
    }

    UIGraphicsEndPDFContext();

    // 5. Save PDF file

    do {
        try pdfData.write(to: outputFileURL, options: .atomic)

        // print("wrote PDF file with multiple pages to: \(outputFileURL.path)")
    } catch {
        print("Could not create PDF file: \(error.localizedDescription)")
    }
}

struct ReviewEntry_Previews: PreviewProvider {
    static var previews: some View {
        ReviewEntry(diaryEntry: DiaryModel(title: "Steps to achieve Heaven", content: "Spiral staircase, Rhinoceros beetle, Spiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation RowSpiral staircase, Rhinoceros beetle, Desolation Row", date: Date()))
    }
}

// Leftover of previous implementation of PDF exporting

//@MainActor
//private func exportPDF(diaryEntry: DiaryModel) {
//    let entryShareView = EntryShareView(diaryEntry: diaryEntry)
//    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
//
//    let renderedUrl = documentDirectory.appending(path: "diaryEntry.pdf")
//
//    // PDF media box rect (A4)
//    if let consumer = CGDataConsumer(url: renderedUrl as CFURL),
//       // Create the CGContext for our PDF pages
//       let pdfContext = CGContext(consumer: consumer, mediaBox: nil, nil) {
//
//        let renderer = ImageRenderer(content: entryShareView)
//        renderer.render { size, renderer in
//            let options: [CFString: Any] = [
//                //
//                kCGPDFContextMediaBox: CGRect(origin: .zero, size: size)
//            ]
//            // beginPDFPage and endPDFPage are needed for however many pages are needed
//            pdfContext.beginPDFPage(options as CFDictionary)
//            pdfContext.translateBy(x: 0, y: 600)
//            // Render the SwiftUI view data onto the page
//            renderer(pdfContext)
//            pdfContext.endPDFPage()
//            pdfContext.closePDF()
//        }
//    }
//
//    print("Saving PDF to \(renderedUrl.path())")
//}
