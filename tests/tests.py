#!python3
import unittest
import urllib.request, json, os


class Tests(unittest.TestCase):

  jenk_port = os.environ['JENKINS_HOST_PORT']

  def test_jenkins_is_online(self):
    test_url = "http://localhost:%s/api/json" % self.jenk_port
    with urllib.request.urlopen(test_url) as url:
      data = json.loads(url.read().decode())
      self.assertIsNotNone(data["mode"])

  def test_computers_are_created(self):
    test_url = "http://localhost:%s/computer/api/json" % self.jenk_port
    with urllib.request.urlopen(test_url) as url:
      data = json.loads(url.read().decode())
      self.assertEqual(len(data["computer"]), 3)

  def test_computers_are_connected(self):
    test_url = "http://localhost:%s/computer/api/json" % self.jenk_port
    with urllib.request.urlopen(test_url) as url:
      data = json.loads(url.read().decode())
      for computer in data["computer"]:
        name = computer["displayName"]
        print ("\nChecking node availability for %s" % name)
        self.assertFalse(computer["offline"])
  

if __name__ == '__main__':
    unittest.main()


