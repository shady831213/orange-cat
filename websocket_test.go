package orange_test

import (
	. "github.com/utatti/orange-cat"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Websocket", func() {
	Describe("#NewWebsocket()", func() {
		It("should return a new Websocket object.", func() {
			sock := NewWebsocket("README.md", nil)
			Expect(sock).NotTo(BeNil())
		})
	})
})
