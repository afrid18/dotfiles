package main

import "fmt"
import "os"

var python = `
def solve():
  pass


if __name__ == '__main__':
  for _ in range(int(input())):
    solve()
`

func main() {
  // for i := 1; i < len(os.Args); i++ {
  //   fmt.Println(os.Args[i])
  // }

  // py := false

  // for _, arg in range os.Args {
  //   if arg == "--python" || arg == "-p" {
  //     py = true
  //   }
  // }

  if len(os.Args) < 2 {
    fmt.Println("Please enter file name")
    return
  }

  filename := os.Args[1] + ".py"

  file, err := os.OpenFile(filename, os.O_WRONLY|os.O_CREATE, 0644)
  if err != nil {
      fmt.Println("Error opening file:", err)
      return
  }
  defer file.Close()

  // Write data to the file
  _, err = file.Write([]byte(python))
  if err != nil {
      fmt.Println("Error writing to file:", err)
      return
  }

  fmt.Println("Created file: ", filename)
}
