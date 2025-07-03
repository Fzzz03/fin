#include <bits/stdc++.h>
#define int long long
using namespace std;
  
void solve() {
int x = 5;
    int y = 7;
    std::cout << "sum(" << x << ", " << y << ") = "
              << sum(x, y) << "\n";

   }

signed main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);

    int t;
    cin >> t;
    while (t--) solve();

    return 0;
}


