class Son {
  son: string = '000';

  constructor(son: string) {
    this.son = son;
  }
}

class Parent {
  son: Son = new Son('111');
}

@Entry
@Component
struct Test {
  @State son: Son = new Son('222');
  @State parent: Parent = new Parent();

  aboutToAppear(): void {
    this.parent.son = this.son;
  }

  build() {
    Column() {
      Text(`${this.son.son}`);
      Text(`${this.parent.son.son}`);
      Button('change')
        .onClick(() => {
          this.parent.son = new Son('444');
          this.parent.son.son = '333';
        })
    }
  }
}