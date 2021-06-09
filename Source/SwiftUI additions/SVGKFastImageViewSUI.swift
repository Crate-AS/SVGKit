
import SwiftUI
import SVGKit


#if os(macOS)
@available(macOS 10.15, *)
public struct SVGKFastImageViewSUI: NSViewRepresentable
{
    let url: URL?
    let size: CGSize
    
    public init(url: URL?, size: CGSize) {
        self.url = url
        self.size = size
    }
    
    public func makeNSView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        svgImage?.size = size
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
    
    public func updateNSView(_ nsView: SVGKFastImageView, context: Context) {
        nsView.image = SVGKImage(contentsOf: url)
        nsView.image.size = size
    }
    
}
#else
@available(iOS 13.0, *)
public struct SVGKFastImageViewSUI:UIViewRepresentable
{
    @Binding var url: URL
    @Binding var size: CGSize
    
    public init(url: Binding<URL>, size: Binding<CGSize>) {
        self._url = url
        self._size = size
    }
    
    public func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        svgImage?.size = size
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
        
    }
    public func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.image = SVGKImage(contentsOf: url)
        uiView.image.size = size
    }
}
#endif
