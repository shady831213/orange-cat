package orange

import (
	"github.com/Depado/bfchroma"
	"github.com/russross/blackfriday"
	bfv2 "gopkg.in/russross/blackfriday.v2"
)

// Global Converter
var MdConverter = NewMarkdownConverter()

type MarkdownConverter struct {
	convert func([]byte) []byte
}

func NewMarkdownConverter() *MarkdownConverter {
	return &MarkdownConverter{blackfriday.MarkdownCommon}
}

func (md *MarkdownConverter) UseBasic() {
	md.convert = blackfriday.MarkdownBasic
}

func (md *MarkdownConverter) UseChroma() {
	md.convert = func(bytes []byte) []byte {
		return bfv2.Run(bytes, bfv2.WithRenderer(bfchroma.NewRenderer()))
	}
}

func (md *MarkdownConverter) Convert(raw []byte) []byte {
	return md.convert(raw)
}
